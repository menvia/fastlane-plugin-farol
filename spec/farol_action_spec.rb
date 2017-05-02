describe Fastlane::Actions::FarolAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The farol plugin is working!")

      Fastlane::Actions::FarolAction.run(nil)
    end
  end
end
