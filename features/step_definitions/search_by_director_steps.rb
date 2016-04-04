Given(/^the following movies exist:$/)do |table|
    table.hashes.each do |movie|
        Movie.create!(movie)
    end
end 

When (/^(?:|I )go to the edit page for "(.+)"$/) do |movie_name|
  visit("/")
  expect(page).to have_content("Include")
  click_on("More about "+movie_name)
  expect(page).to have_content("Details about " + movie_name)
  click_on("Edit")
  expect(page).to have_content("Edit Existing Movie")
end

And (/^I fill in "(.+)" with "(.+)"$/) do |feild, data|
    expect(page).to have_content(feild)
    fill_in(feild, :with => data)
end

And (/^I press "(.+)"/) do |name|
    click_on(name)
end

Then (/^the director of "(.+)" should be "(.+)"$/) do |movie,director|
    expect(page).to have_content("Details about "+movie)
    expect(page).to have_content("Director: "+director)
end

Given (/^I am on the details page for "(.+)"$/) do |movie|
    visit('/') #go to home
    click_on("More about "+movie)
    expect(page).to have_content("Details about "+movie)
end

When (/^I follow "(.+)"$/) do |link|
    click_on(link)
end

Then (/^I should be on the Similar Movies page for "(.+)"$/) do |movie|
    expect(page).to have_content("Similar Movies to "+movie) 
end

And  (/^I should see "(.+)"$/) do |value|
    expect(page).to have_content(value) 
end

But  (/^I should not see "(.+)"$/) do |value|
    expect(page).to_not have_content(value) 
end

Then (/^I should be on the home page$/) do
    expect(page).to have_content("All Movies") 
end
