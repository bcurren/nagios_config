describe NagiosConfigParser do
  it "should parse" do
    parser = NagiosConfigParser.new

    file = '
      define hostgroup {
        host_name      computername.example.com
        alias          computername
        display_name   My Computer
        address        192.168.10.1
        parents        computername2.example.com
        hostgroups     group1, group2
        check_command  check_something
      }
      define hostdependency {}
      define hostescalation {}
      define hostextinfo {}
      define host {}
      define servicedependency {}
      define serviceescalation {}
      define serviceextinfo {}
      define servicegroup {}
      define service {}
      define contactgroup {}
      define contact {}
      define timeperiod {}
      define command {}
    '
    result = parser.parse(file)
    result.should_not == nil
  end
end