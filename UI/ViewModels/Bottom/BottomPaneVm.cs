using System.Collections;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Windows.Data;
using System.Windows.Input;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

public sealed class BottomPaneVm : ViewModelBase
{
    private readonly IEnumerable _source_items;
    private readonly HashSet<string> _active_severities = new(StringComparer.Ordinal)
    {
        "E", "W", "H"
    };

    private ICollectionView? _filtered_view;
    private bool _use_severity_filter;

    public BottomPaneVm(
        string title,
        IEnumerable items,
        ICommand clear_command,
        ICommand activate_item_command,
        bool use_severity_filter = false)
    {
        Title = title;
        _source_items = items;
        ClearCommand = clear_command;
        ActivateItemCommand = activate_item_command;
        _use_severity_filter = use_severity_filter;

        if (use_severity_filter && items is INotifyCollectionChanged)
        {
            _filtered_view = CollectionViewSource.GetDefaultView(items);
            _filtered_view.Filter = FilterProblem;
            if (items is INotifyCollectionChanged incc)
                incc.CollectionChanged += (_, _) => _filtered_view?.Refresh();
        }
    }

    public string Title { get; }
    public ObservableCollection<BottomBadgeVm> Badges { get; } = [];

    /// <summary>Items hiển thị — đã lọc severity nếu Problems.</summary>
    public IEnumerable Items => _filtered_view is not null ? _filtered_view : _source_items;

    public ICommand ClearCommand { get; }
    public ICommand ActivateItemCommand { get; }

    public void ReplaceBadges(IEnumerable<BottomBadgeVm> badges)
    {
        Badges.Clear();
        foreach (var badge in badges)
        {
            if (badge.SeverityKey is not null)
                badge.IsFilterActive = _active_severities.Contains(badge.SeverityKey);
            else
                badge.ApplyChrome();
            Badges.Add(badge);
        }
    }

    public void ToggleSeverityFilter(string? severity_key)
    {
        if (string.IsNullOrEmpty(severity_key) || !_use_severity_filter) return;

        if (!_active_severities.Remove(severity_key))
            _active_severities.Add(severity_key);

        // Không cho tắt hết — nếu rỗng thì bật lại cái vừa tắt.
        if (_active_severities.Count == 0)
            _active_severities.Add(severity_key);

        foreach (var badge in Badges)
        {
            if (badge.SeverityKey is null) continue;
            badge.IsFilterActive = _active_severities.Contains(badge.SeverityKey);
        }

        _filtered_view?.Refresh();
        OnPropertyChanged(nameof(Items));
    }

    private bool FilterProblem(object obj)
    {
        if (obj is not ProblemItemVm problem) return true;
        var key = problem.SeverityBadge switch
        {
            "E" => "E",
            "W" => "W",
            _ => "H"
        };
        return _active_severities.Contains(key);
    }
}
