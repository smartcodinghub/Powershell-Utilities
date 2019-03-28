function Watch-Command {
    [Alias("Watch")]
	[CmdletBinding(PositionalBinding = $false)]
    param(
		[Alias("c")]
        [Parameter(Position = 0, Mandatory = $true)]
		[ScriptBlock] $Command,
		[Alias("t")]
		[Parameter(Mandatory = $false)]
		[int] $Time = 2)

    echo "Watching command {$($Command.ToString())} every $($Time) seconds.";
    $left  = [Console]::CursorLeft;
    $top   = [Console]::CursorTop;

    while(1)
    {
        $output = $Command.Invoke() | Out-String;
        [Console]::SetCursorPosition($left, $top);
        echo "Last refresh: $(Get-Date).";
        echo $output;
        sleep $Time;
    }
}