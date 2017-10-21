RSpec.describe 'Season' do
  let(:comparison) do
    CR::Spec::Comparison.new SPECLI, slice: [:season]
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
          describe "#{example_name} (#{d})" do
            it { expect(comparison).to match_for d }
          end
        end
      end
    end
  end

  describe 'mass test'
end
