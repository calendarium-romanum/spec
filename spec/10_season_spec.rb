RSpec.describe 'Season', type: :aruba do
  let(:authority) do
    CR::Spec::Serializer.new(CR::Calendar.new(TEST_YEAR))
  end

  describe 'limits' do
    %i(first_advent_sunday nativity baptism_of_lord ash_wednesday pentecost).each do |day|
      describe day do
        date = CR::Temporale::Dates.public_send(day, TEST_YEAR)

        {
          'day before' => date - 1,
          'itself' => date,
          'day after' => date + 1
        }.each_pair do |example_name, d|
          describe "#{example_name} - #{d}" do
            before :each do
              run "#{SPECLI} #{d}"
            end

            it do
              expect(last_command).to be_successfully_executed
              f = ->(h) { h.slice('season') }
              expect(f.(JSON.load(all_output))).to eq f.(authority.(d))
            end
          end
        end
      end
    end
  end

  describe 'mass test'
end
