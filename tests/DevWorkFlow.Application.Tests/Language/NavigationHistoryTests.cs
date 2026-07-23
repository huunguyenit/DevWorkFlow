using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class NavigationHistoryTests
{
    private static NavigationHistoryEntry At(string uri, int offset) => new(uri, offset);

    [Fact]
    public void Back_returns_last_pushed_position()
    {
        var history = new NavigationHistory();
        history.Push("a.xml", 10);

        Assert.True(history.TryBack(At("a.xml", 90), out var target));
        Assert.Equal(At("a.xml", 10), target);
        Assert.False(history.CanGoBack);
    }

    [Fact]
    public void Forward_returns_where_back_came_from()
    {
        var history = new NavigationHistory();
        history.Push("a.xml", 10);
        history.TryBack(At("a.xml", 90), out _);

        Assert.True(history.TryForward(At("a.xml", 10), out var target));
        Assert.Equal(At("a.xml", 90), target);
    }

    [Fact]
    public void Push_clears_forward_branch()
    {
        var history = new NavigationHistory();
        history.Push("a.xml", 10);
        history.TryBack(At("a.xml", 90), out _);
        Assert.True(history.CanGoForward);

        history.Push("a.xml", 30);

        Assert.False(history.CanGoForward);
    }

    // Đổi Source↔Insight hay F12 tại chỗ không được sinh mục lịch sử ảo (spec P6-01).
    [Fact]
    public void Push_ignores_duplicate_of_top_and_invalid_entries()
    {
        var history = new NavigationHistory();
        history.Push("a.xml", 10);
        history.Push("A.XML", 10);   // cùng file (khác hoa/thường) + cùng offset
        history.Push("a.xml", -1);   // offset không hợp lệ
        history.Push("", 5);         // chưa gắn file

        Assert.Single(history.BackEntries);
    }

    [Fact]
    public void Back_stack_is_capped_and_drops_oldest()
    {
        var history = new NavigationHistory();
        for (var i = 0; i < NavigationHistory.MaxDepth + 10; i++)
            history.Push("a.xml", i);

        Assert.Equal(NavigationHistory.MaxDepth, history.BackEntries.Count);
        Assert.Equal(10, history.BackEntries[0].Offset);   // 10 mục cũ nhất đã rơi
    }

    [Fact]
    public void Back_and_forward_cross_documents()
    {
        var history = new NavigationHistory();
        history.Push("a.xml", 10);                          // rời a.xml → mở b.xml

        Assert.True(history.TryBack(At("b.xml", 200), out var back));
        Assert.Equal(At("a.xml", 10), back);
        Assert.True(history.TryForward(At("a.xml", 10), out var forward));
        Assert.Equal(At("b.xml", 200), forward);
    }

    [Fact]
    public void Empty_history_reports_nothing_to_do()
    {
        var history = new NavigationHistory();

        Assert.False(history.CanGoBack);
        Assert.False(history.CanGoForward);
        Assert.False(history.TryBack(At("a.xml", 1), out _));
        Assert.False(history.TryForward(At("a.xml", 1), out _));
    }

    // Caret hiện tại không hợp lệ (chưa gắn file) thì vẫn lùi được, chỉ không ghi forward.
    [Fact]
    public void Back_without_valid_current_position_does_not_record_forward()
    {
        var history = new NavigationHistory();
        history.Push("a.xml", 10);

        Assert.True(history.TryBack(default, out _));
        Assert.False(history.CanGoForward);
    }
}
