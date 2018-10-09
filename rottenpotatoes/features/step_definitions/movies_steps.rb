Given /^the following movies exist:$/ do |table|
    table.hashes.each do |movie|
        Movie.create(movie)
    end
end


Then /^the director of "(.+)" should be "(.+)"$/ do |movie, director|
    visit movie_path Movie.find_by(title: movie)
    expect(page.body).to match(/Director:\s#{director}/) 

end