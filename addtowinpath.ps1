$dir = [IO.Path]::Combine($env:USERPROFILE, 'bin')
$cur = [Environment]::GetEnvironmentVariable('Path','User')
if (-not ($cur.Split(';') -contains $dir)) {
    Set-PSDebug -Trace 1
    [Environment]::SetEnvironmentVariable('Path', ($cur + ';' + $dir).Trim(';'), 'User')
}
