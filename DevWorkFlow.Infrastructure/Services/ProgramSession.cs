using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>Giữ Program FBO đang mở trong phiên làm việc.</summary>
public class ProgramSession : IProgramSession
{
    public ProgramContext? Current { get; private set; }

    public event EventHandler? ProgramChanged;

    public void SetProgram(ProgramContext program)
    {
        Current = program ?? throw new ArgumentNullException(nameof(program));
        ProgramChanged?.Invoke(this, EventArgs.Empty);
    }

    /// <summary>Cập nhật Program không phát ProgramChanged (tránh refresh trùng).</summary>
    public void UpdateProgram(ProgramContext program)
    {
        Current = program ?? throw new ArgumentNullException(nameof(program));
    }

    public void Clear()
    {
        Current = null;
        ProgramChanged?.Invoke(this, EventArgs.Empty);
    }
}
