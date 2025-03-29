$StartDate = Get-Date "2023-01-01"
$EndDate = Get-Date "2024-03-28"

while ($StartDate -le $EndDate) {
    "Commit on $StartDate" | Out-File -Append history.txt
    git add history.txt
    $Env:GIT_COMMITTER_DATE = $StartDate.ToString("yyyy-MM-dd HH:mm:ss")
    $Env:GIT_AUTHOR_DATE = $StartDate.ToString("yyyy-MM-dd HH:mm:ss")
    git commit -m "Commit on $($StartDate.ToString('yyyy-MM-dd'))"
    $StartDate = $StartDate.AddDays(1)
}

git push origin main
