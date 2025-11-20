package com.neofilm.model;

public class Movie {
    private int id;
    private String title;
    private String releaseDate;
    private String genre;
    private String synopsis;
    private String posterPath;
    private double rating;

    private String director;
    private String actors;
    private int duration;

    public Movie() {
    }

    public Movie(int id, String title, String releaseDate, String genre, String synopsis,
            String posterPath, double rating, String director, String actors, int duration) {
        this.id = id;
        this.title = title;
        this.releaseDate = releaseDate;
        this.genre = genre;
        this.synopsis = synopsis;
        this.posterPath = posterPath;
        this.rating = rating;
        this.director = director;
        this.actors = actors;
        this.duration = duration;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public String getGenre() {
        return genre;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public String getPosterPath() {
        return posterPath;
    }

    public double getRating() {
        return rating;
    }

    public String getDirector() {
        return director;
    }

    public String getActors() {
        return actors;
    }

    public int getDuration() {
        return duration;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public void setPosterPath(String posterPath) {
        this.posterPath = posterPath;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public void setActors(String actors) {
        this.actors = actors;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }
}