configuration WebServerConfig{
    Node $computerName {
        WindowsFeature IIS{
            Name = 'web-server',
            Ensure = 'present'
        }
    }
}

