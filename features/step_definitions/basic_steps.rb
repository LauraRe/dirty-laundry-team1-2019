Given("I am on the {string} page") do |string|
  visit root_path
end

Given("we have {int} laundry") do |int|
  int.times do |room|
    create(:laundry)
  end
end

Given("I am logged in as {string}") do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end

Given /^I log out$/ do
  logout
end

Given("we have (1 )user with email {string} and role {string}") do |email, role|
  FactoryBot.create(:user, email: email, role: role)
end

Given("I click {string}") do |element|
  click_on element
end

When("I click on {string} on {string}") do |time, date|
  case date
  when "tomorrow"
    date_slot = Date.today + 1.day
  end

  within("##{date_slot.to_formatted_s(:dc)}") do
    click_on time
  end
end
 