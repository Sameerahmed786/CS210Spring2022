# FILL IN ALL THE FUNCTIONS IN THIS TEMPLATE
# MAKE SURE YOU TEST YOUR FUNCTIONS WITH MULTIPLE TEST CASES
# ASIDE FROM THE SAMPLE FILES PROVIDED TO YOU, TEST ON YOUR OWN FILES

# WHEN DONE, SUBMIT THIS FILE TO CANVAS

from collections import defaultdict
from collections import Counter


# YOU MAY NOT CODE ANY OTHER IMPORTS

# ------ TASK 1: READING DATA  --------

# 1.1
def read_ratings_data(f):
    rating_dict = {}
    # parameter f: movie ratings file name f (e.g. "movieRatingSample.txt")
    # return: dictionary that maps movie to ratings
    # WRITE YOUR CODE BELOW
    for line in open(f):
        movie, rating, rate = line.split('|')
        rating_dict[movie] = []
    for line in open(f):
        movie, rating, rate = line.split('|')
        rating_dict[movie].append(rating)

    return rating_dict


# 1.2
def read_movie_genre(f):
    genre_dict = {}
    for line in open(f):
        genre, rank, movie = line.split('|')
        movie = movie.strip('\n')
        genre_dict[movie] = genre
    return genre_dict


# parameter f: movies genre file name f (e.g. "genreMovieSample.txt")
# return: dictionary that maps movie to genre
# WRITE YOUR CODE BELOW


# ------ TASK 2: PROCESSING DATA --------

# 2.1
def create_genre_dict(d):
    genres_dict = {}
    for key, item in d.items():
        genres_dict[item] = []
    for key, item in d.items():
        genres_dict[item].append(key)
    return genres_dict


# parameter d: dictionary that maps movie to genre
# return: dictionary that maps genre to movies
# WRITE YOUR CODE BELOW


# 2.2
def calculate_average_rating(d):
    avg_rating = {}

    for key, items in d.items():
        total = 0
        for item in items:
            total += float(item)
        avg_rating[key] = total / len(items)
    return avg_rating


# parameter d: dictionary that maps movie to ratings
# return: dictionary that maps movie to average rating
# WRITE YOUR CODE BELOW


# ------ TASK 3: RECOMMENDATION --------

# 3.1
def get_popular_movies(d, n=10):
    pop_movies = Counter(d)
    return pop_movies.most_common(n)


# parameter d: dictionary that maps movie to average rating
# parameter n: integer (for top n), default value 10
# return: dictionary that maps movie to average rating
# WRITE YOUR CODE BELOW


# 3.2
def filter_movies(d, threshold_rating = 3):
    new_movie_ratings = dict()
    for key, value in d.items():
        if value >= threshold_rating:
            new_movie_ratings[key] = value
    return new_movie_ratings


# parameter d: dictionary that maps movie to average rating
# parameter thres_rating: threshold rating, default value 3
# return: dictionary that maps movie to average rating
# WRITE YOUR CODE BELOW


# 3.3
def get_popular_in_genre(genre, genres_dict, avg_rating, n = 5):
    movie_to_avg_dict = {}
    movieGenres = genres_dict[genre]
    for i in movieGenres:
        movie_to_avg_dict[i] = avg_rating[i]

    movie_to_avg_dict = dict(sorted(movie_to_avg_dict.items(), key = lambda item: item[1], reverse = True))

    movie_to_avg_dict = {j: movie_to_avg_dict[j] for j in list(movie_to_avg_dict)[:n]}
    return movie_to_avg_dict


# parameter genre: genre name (e.g. "Comedy")
# parameter genre_to_movies: dictionary that maps genre to movies
# parameter movie_to_average_rating: dictionary  that maps movie to average rating
# parameter n: integer (for top n), default value 5
# return: dictionary that maps movie to average rating
# WRITE YOUR CODE BELOW


# 3.4
def get_genre_rating(genre, genre_to_movies, movie_to_average_rating):
    movies = genre_to_movies[genre]
    total = 0
    for movie in movies:
        total += movie_to_average_rating[movie]

    return total/len(movies)


# parameter genre: genre name (e.g. "Comedy")
# parameter genre_to_movies: dictionary that maps genre to movies
# parameter movie_to_average_rating: dictionary  that maps movie to average rating
# return: average rating of movies in genre
# WRITE YOUR CODE BELOW


# 3.5
def genre_popularity(genre_to_movies, movie_to_average_rating, n=5):
    genre_avg = {}
    top_rated_genres = {}

    for key, items in genre_to_movies.items():
        total = 0
        avg = 0
        for item in items:
            total += movie_to_average_rating[item]
        avg = total/len(items)
        genre_avg[key] = avg
    pop_genres = Counter(genre_avg)
    return pop_genres.most_common(n)

# parameter genre_to_movies: dictionary that maps genre to movies
# parameter movie_to_average_rating: dictionary  that maps movie to average rating
# parameter n: integer (for top n), default value 5
# return: dictionary that maps genre to average rating
# WRITE YOUR CODE BELOW


# ------ TASK 4: USER FOCUSED  --------

# 4.1
def read_user_rating(s):
    user_rating = {}
    for line in open(s):
        movie, rating, user = line.split('|')
        rating = float(rating)
        user = user.strip('\n')
        if user in user_rating:
            user_rating[user].append((movie, rating))
        else:
            user_rating[user] = [(movie, rating)]
    return user_rating



# parameter f: movie ratings file name (e.g. "movieRatingSample.txt")
# return: dictionary that maps user to movies and ratings
# WRITE YOUR CODE BELOW


# 4.2
def get_user_genre(user_id, user_to_movies, movie_to_genre):
    user_id = str(user_id)
    max_rating = 0
    top_movie = ''
    for movie, rating in user_to_movies[user_id]:
        if rating > max_rating:
            max_rating = rating
            top_movie = movie
    return movie_to_genre[top_movie]


# parameter user_id: user id
# parameter user_to_movies: dictionary that maps user to movies and ratings
# parameter movie_to_genre: dictionary that maps movie to genre
# return: top genre that user likes
# WRITE YOUR CODE BELOW


# 4.3
def recommend_movies(user_id, user_movies, movies_genre, movies_average_rating):
    user_id = str(user_id)
    nonwatched_movies = []
    recommend_dict = {}
    user_top_genre = get_user_genre(user_id, user_movies, movies_genre)
    for key, item in movies_genre.items():
        if item == user_top_genre and key not in user_movies[user_id][:][0]:
            nonwatched_movies.append(key)
    counter = 0
    for item in nonwatched_movies:
        recommend_dict[item] = movies_average_rating[item]
        counter += 1
        if counter == 3:
            break
    return recommend_dict

# parameter user_id: user id
# parameter user_to_movies: dictionary that maps user to movies and ratings
# parameter movie_to_genre: dictionary that maps movie to genre
# parameter movie_to_average_rating: dictionary that maps movie to average rating
# return: dictionary that maps movie to average rating
# WRITE YOUR CODE BELOW


# -------- main function for your testing -----
def main():
    movie_ratings = read_ratings_data('movie_ratings.txt')
    movie_genres = read_movie_genre('movie_genres.txt')
    genre_list = create_genre_dict(movie_genres)
    average_rating = calculate_average_rating(movie_ratings)
    popular_movies = get_popular_movies(average_rating, 3)
    filtered_movies = filter_movies(average_rating)
    popular_movies_in_genre = get_popular_in_genre('Comedy', genre_list, average_rating)
    average_genre_rating = get_genre_rating('Action', genre_list, average_rating)
    my_list = genre_popularity(genre_list, average_rating, 3)
    users_genre = read_user_rating('movie_ratings.txt')
    top_users_genre = get_user_genre(1, users_genre, movie_genres)
    # print(f'Top Rated Users Genre: {top_users_genre}')
    recommend_dict = recommend_movies(1, users_genre, movie_genres, average_rating)
    print(recommend_dict)


# write all your test code here
# this function will be ignored by us when grading


# DO NOT write ANY CODE (including variable names) outside of any of the above functions
# In other words, ALL code your write (including variable names) MUST be inside one of
# the above functions


# program will start at the following main() function call
# when you execute hw1.py
main()

