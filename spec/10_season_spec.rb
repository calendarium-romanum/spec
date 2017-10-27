RSpec.describe 'Season' do
  describe 'limits' do
    let(:comparison) do
      CR::Spec::Comparison.new SPECLI, slice: [:season]
    end

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

  describe 'weeks' do
    let(:comparison) do
      CR::Spec::Comparison.new SPECLI, slice: [:season, :season_week]
    end

    (Date.new(TEST_YEAR, 1, 1) .. Date.new(TEST_YEAR, 12, 31))
      .each do |date|

      # we don't need to check all days
      next unless date.sunday? || # edge
                  date.monday? || # non-edge
                  date.saturday? # edge

      describe date do
        it { expect(comparison).to match_for date }
      end
    end
  end
end
