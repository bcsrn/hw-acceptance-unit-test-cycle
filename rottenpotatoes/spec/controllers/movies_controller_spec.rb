require 'rails_helper'

describe MoviesController do
    describe 'Search movies by the same director' do
        it 'should call Movie\'s similar method' do
            expect(Movie).to receive(:similar_director).with('The Help')
            get :similar, { title: 'The Help' }
        end

        it 'should assign movies with same director if director exists' do
            movies = ['Chicken Run', 'The Incredibles']
            Movie.stub(:similar_director).with(movies[0]).and_return(movies)
            get :similar, { title: movies[0] }
            expect(assigns(:similar_movies)).to eql(movies)
        end

        it "should redirect to home page if no director info" do
            Movie.stub(:similar_director).with('Alien').and_return(nil)
            get :similar, { title: 'Alien' }
            expect(response).to redirect_to(movies_path)
        end
    end
end