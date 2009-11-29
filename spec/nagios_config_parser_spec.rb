describe NagiosConfigParser do
  it "should parse" do
    parser = NagiosConfigParser.new

    file = '
      define hostgroup {}
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
    result.should_not be_nil
  end
end