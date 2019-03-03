Then("I should see {string}") do |expected_content|
  expect(page).to have_content expected_content
end

Then("I should be redirected to index page") do
  expect(current_path).to eq root_path 
end

Then("(s/S)how me the page") do
  save_and_open_page
end
