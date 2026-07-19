using DevWorkFlow.Editor.Bridge;
using Xunit;

namespace DevWorkFlow.Editor.Tests;

public class EditorHostMessageTests
{
    [Fact]
    public void TryParseIncoming_recognizes_response_by_id()
    {
        var json = """{"id":"req-1","result":{"offset":5},"error":null}""";

        var ok = EditorHostMessage.TryParseIncoming(json, out var response, out var evt);

        Assert.True(ok);
        Assert.Null(evt);
        Assert.NotNull(response);
        Assert.Equal("req-1", response!.Id);
        Assert.Null(response.Error);
        Assert.True(response.Result!.Value.TryGetProperty("offset", out var offset));
        Assert.Equal(5, offset.GetInt32());
    }

    [Fact]
    public void TryParseIncoming_recognizes_error_response()
    {
        var json = """{"id":"req-2","result":null,"error":"boom"}""";

        var ok = EditorHostMessage.TryParseIncoming(json, out var response, out var evt);

        Assert.True(ok);
        Assert.Null(evt);
        Assert.Equal("boom", response!.Error);
    }

    [Fact]
    public void TryParseIncoming_recognizes_event_by_event_field()
    {
        var json = """{"event":"contentChanged","payload":{"text":"<a/>"}}""";

        var ok = EditorHostMessage.TryParseIncoming(json, out var response, out var evt);

        Assert.True(ok);
        Assert.Null(response);
        Assert.NotNull(evt);
        Assert.Equal("contentChanged", evt!.Event);
        Assert.True(evt.Payload!.Value.TryGetProperty("text", out var text));
        Assert.Equal("<a/>", text.GetString());
    }

    [Fact]
    public void TryParseIncoming_returns_false_for_garbage()
    {
        var ok = EditorHostMessage.TryParseIncoming("not json", out var response, out var evt);

        Assert.False(ok);
        Assert.Null(response);
        Assert.Null(evt);
    }

    [Fact]
    public void TryParseIncoming_returns_false_when_neither_id_nor_event_present()
    {
        var ok = EditorHostMessage.TryParseIncoming("""{"foo":"bar"}""", out var response, out var evt);

        Assert.False(ok);
        Assert.Null(response);
        Assert.Null(evt);
    }

    [Fact]
    public void BuildRequestJson_round_trips_through_TryParseIncoming_shape()
    {
        var json = EditorHostMessage.BuildRequestJson("req-3", EditorHostCommands.RevealOffset, new { offset = 42 });

        Assert.Contains("\"id\":\"req-3\"", json);
        Assert.Contains("\"command\":\"revealOffset\"", json);
        Assert.Contains("\"offset\":42", json);
    }
}
