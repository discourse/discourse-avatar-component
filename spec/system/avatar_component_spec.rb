# frozen_string_literal: true

RSpec.describe "Category column", type: :system do
  let!(:theme) { upload_theme_component }
  fab!(:category)
  fab!(:topics) { Fabricate.times(3, :topic, category: category) }

  it "renders the modified posters column in topic list" do
    visit "/latest"

    expect(page).to have_css("td.topic-list-data.posters.theme-avatar-small", count: 3)
  end

  it "allows the size to be changed in topic list" do
    theme.update_setting(:latest_avatar_size, "large")
    theme.save!

    visit "/latest"

    expect(page).to have_css("td.topic-list-data.posters.theme-avatar-large", count: 3)
  end
end
