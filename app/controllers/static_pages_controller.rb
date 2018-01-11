class StaticPagesController < ApplicationController

require 'open-uri'
require 'will_paginate/array'

  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
      @post_ordenados = Micropost.find_by_sql(
        'SELECT     microposts.id,
        COUNT       (votes.micropost_id)
        AS          numbersOfVotes
        FROM        votes
        LEFT JOIN   microposts
        ON          votes.micropost_id = microposts.id
        GROUP BY    microposts.id
        ORDER BY    count(votes.micropost_id) 
        DESC
      ')
      @posts_masvotados = Micropost.find_by_sql(
        'SELECT     microposts.id,
        COUNT       (votes.micropost_id)
        AS          numbersOfVotes
        FROM        votes
        LEFT JOIN   microposts
        ON          votes.micropost_id = microposts.id
        GROUP BY    microposts.id
        ORDER BY    count(votes.micropost_id) 
        DESC
      ')
      @petitions_masvotadas = Micropost.find_by_sql(
        'SELECT     microposts.id,
        COUNT       (votes.micropost_id)
        AS          numbersOfVotes
        FROM        votes
        LEFT JOIN   microposts
        ON          votes.micropost_id = microposts.id
        WHERE       microposts.petition = true
        GROUP BY    microposts.id
        ORDER BY    count(votes.micropost_id) 
        DESC
      ')
      @popular_petitions = Micropost.where(id: @post_ordenados).where(petition: true)
      @candidates = User.find_by_sql(
        'SELECT     users.id,
        COUNT       (relationships.followed_id)
        AS          numbersOfFollowers
        FROM        relationships
        LEFT JOIN   users
        ON          relationships.followed_id = users.id
        GROUP BY    users.id  
        ORDER BY    count(followed_id) 
        DESC
      ')
      @grupos_acciones = Group.where(user_id: current_user)

      @lasts_comments = Comment.last(100)
      @hot_posts = @lasts_comments.map(&:micropost_id)
      @hot_posts_numero = @hot_posts.group_by(&:to_s).values.max_by(&:size).try(:first)

      @a_number = @hot_posts.group_by(&:to_s).values.max_by(&:size).try(:first)

      @b = @hot_posts - [@a_number]
      @b_number = @b.group_by(&:to_s).values.max_by(&:size).try(:first)

      @c = @b - [@b_number]
      @c_number = @c.group_by(&:to_s).values.max_by(&:size).try(:first)

      @d = @c - [@c_number]
      @d_number = @d.group_by(&:to_s).values.max_by(&:size).try(:first)

      @e = @d - [@d_number]
      @e_number = @e.group_by(&:to_s).values.max_by(&:size).try(:first)

      @f = @e - [@e_number]
      @f_number = @f.group_by(&:to_s).values.max_by(&:size).try(:first)

      @g = @f - [@f_number]
      @g_number = @g.group_by(&:to_s).values.max_by(&:size).try(:first)

      @h = @g - [@g_number]
      @h_number = @h.group_by(&:to_s).values.max_by(&:size).try(:first)

      @i = @h - [@h_number]
      @i_number = @i.group_by(&:to_s).values.max_by(&:size).try(:first)

      @j = @i - [@i_number]
      @j_number = @j.group_by(&:to_s).values.max_by(&:size).try(:first)

      @array_of_hot_posts = [@a_number, @b_number, @c_number, @d_number, @e_number, @f_number, @g_number, @h_number, @i_number, @j_number,]

      
      @lasts_hashtags = Micropost.last(100)
      @last_posts = Micropost.order('created_at DESC').take(100)
      @hot_hashtags = @last_posts.map(&:hashtag1)

      @hot_hashtags_numero = @hot_hashtags.group_by(&:to_s).values.max_by(&:size).try(:first)

      @hashtag1_array = @hot_hashtags - [@hot_hashtags_numero]
      @hashtag1 = @hashtag1_array.group_by(&:to_s).values.max_by(&:size).try(:first)

      @hashtag2_array = @hashtag1_array - [@hashtag1]
      @hashtag2 = @hashtag2_array.group_by(&:to_s).values.max_by(&:size).try(:first)

      @hashtag3_array = @hashtag2_array - [@hashtag2]
      @hashtag3 = @hashtag3_array.group_by(&:to_s).values.max_by(&:size).try(:first)

      @hashtag4_array = @hashtag3_array - [@hashtag3]
      @hashtag4 = @hashtag4_array.group_by(&:to_s).values.max_by(&:size).try(:first)

      @hashtag5_array = @hashtag4_array - [@hashtag4]
      @hashtag5 = @hashtag5_array.group_by(&:to_s).values.max_by(&:size).try(:first)

      @hashtag6_array = @hashtag5_array - [@hashtag5]
      @hashtag6 = @hashtag6_array.group_by(&:to_s).values.max_by(&:size).try(:first)

      @hashtag7_array = @hashtag6_array - [@hashtag6]
      @hashtag7 = @hashtag7_array.group_by(&:to_s).values.max_by(&:size).try(:first)

      @hashtag8_array = @hashtag7_array - [@hashtag7]
      @hashtag8 = @hashtag8_array.group_by(&:to_s).values.max_by(&:size).try(:first)

      @hashtag9_array = @hashtag8_array - [@hashtag8]
      @hashtag9 = @hashtag9_array.group_by(&:to_s).values.max_by(&:size).try(:first)

      @hashtag10_array = @hashtag9_array - [@hashtag9]
      @hashtag10 = @hashtag10_array.group_by(&:to_s).values.max_by(&:size).try(:first) 

      @array_off_hashtags = [@hot_hashtags_numero, @hashtag1, @hashtag2, @hashtag3, @hashtag4, @hashtag5, @hashtag6, @hashtag7, @hashtag8, @hashtag9, @hashtag10]     

    end
  end

  def popular
    @posts_masvotados = Micropost.find_by_sql(
      'SELECT     microposts.id,
      COUNT       (votes.micropost_id)
      AS          numbersOfVotes
      FROM        votes
      LEFT JOIN   microposts
      ON          votes.micropost_id = microposts.id
      GROUP BY    microposts.id
      ORDER BY    count(votes.micropost_id) 
      DESC
      ')

     @petitions_masvotadas = Micropost.find_by_sql(
      'SELECT     microposts.id,
      COUNT       (votes.micropost_id)
      AS          numbersOfVotes
      FROM        votes
      LEFT JOIN   microposts
      ON          votes.micropost_id = microposts.id
      WHERE       microposts.petition = true
      GROUP BY    microposts.id
      ORDER BY    count(votes.micropost_id) 
      DESC
      ')
    @popular_petitions = Micropost.where(id: @post_ordenados).where(petition: true)
    @candidates = User.find_by_sql(
      'SELECT     users.id,
      COUNT       (relationships.followed_id)
      AS          numbersOfFollowers
      FROM        relationships
      LEFT JOIN   users
      ON          relationships.followed_id = users.id
      GROUP BY    users.id  
      ORDER BY    count(followed_id) 
      DESC
      ')
    if logged_in?
      @micropost = current_user.microposts.build
    end
  end

  def popular_last_day
    @posts_masvotados = Micropost.find_by_sql(
      'SELECT     microposts.id,
      COUNT       (votes.micropost_id)
      AS          numbersOfVotes
      FROM        votes
      LEFT JOIN   microposts
      ON          votes.micropost_id = microposts.id
      GROUP BY    microposts.id
      ORDER BY    count(votes.micropost_id) 
      DESC
      ')
    

    if logged_in?
      @micropost = current_user.microposts.build
    end
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
