function Send-SlackMessage {

    [CmdletBinding()]
    param(
    # Slack user name to 
    [Parameter(Mandatory=$True)]
    [string] $userName,
    # Url to Slack Web Hook endpoint
    [Parameter(Mandatory=$True)]
    [string] $webHookUrl,       
    # Text message to send to the Slack API channel
    [Parameter(Mandatory=$True)]
    [string] $message
    )

    $payLoad = @{
        username = $userName;
        text = $message;
    }

    try{
        Invoke-RestMethod -Method POST -Body ($payLoad | ConvertTo-Json -Depth 4) -Uri $webHookUrl 
    }catch{
        Write-Error "An error occurred while attempting to send Slack notification"
        Write-Error $_.Exception
    }
}

Send-SlackMessage -userName "Octopus Deploy" -message "Test" -webHookUrl 'https://hooks.slack.com/services/T4GKY0Z61/B9JLNAA3X/HmNT0s23n00zADyBsXtXZx' -Debug 