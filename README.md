# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

  def search
    if params[:address].present?
      @events = Event.where('address LIKE ?', "%#{params[:address]}%")
    else params[:freeword].present?
      @events = Event.where("%#{params[:freeword]}%")
    end
  end


<div class="top-page">
  <% if user_signed_in? %> 
    <% if flash[:notice] %>
      <p class="notice"><%= flash[:notice] %></p>
    <% end %>
  <% end %>


    <div class="card-deck" style="width:18rem">
      <div class="card">
        <% image_tag "img_tokyo.jpg", size: '100x200', class: "card-img-top" %>
      </div>
   
      <div class="card">
        <img class="card-img-top" src="../images/img_sapporo.jpg" alt="Card image cap">
      </div>

      <div class="card">
        <img class="card-img-top" src="../images/img_osaka.jpg" alt="Card image cap">
      </div>

      <div class="card">
        <img class="card-img-top" src="../images/img_kyoto.jpg" alt="Card image cap">
      </div>
    </div>
  </div>


<div class="area-box">
<div class="container">

<div class="card-group">
  <div class="card">
    <img src="" class="card-img-top" alt="東京">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated 3 mins ago</small>
    </div>
  </div>





<div class="card" style="width: 18rem;">
  <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" 
              preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Image cap">
              <title>Placeholder</title><rect fill="#868e96" width="100%" height="100%"/>
              <text fill="#dee2e6" dy=".3em" x="50%" y="50%">東京</text></svg>
  <div class="card-body">
    <h5 class="card-title">東京</h5>
    <a href="#" class="btn btn-primary">部屋を探す</a>
  </div>
</div>



  <div class="panel-area row m-5">
    <h1 class="section-title">おすすめのエリア</h1>
    <div class="panel-item col-lg-3 col-6">
     <span>東京</span>
     <%= image_tag 'img_tokyo', size: '100x200' %>
    </div>
    <div class="panel-item col-lg-3 col-6">
    <span>札幌</span>
      <%= image_tag 'img_sapporo', size: '100x200' %>
    </div>
    <div class="panel-item col-lg-3 col-6">
    <span>大阪</span>
      <%= image_tag 'img_osaka', size: '100x200' %>
    </div>
    <div class="panel-item col-lg-3 col-6">
    <span>京都</span>
     <%= image_tag 'img_kyoto', size: '100x200' %>
    </div>
  </div>
  </div>



    @events = Event.search(params[:keyword])
    @keyword = params[:keyword]



          <td><%= @event.room_name %></td>
          <td><%= @event.room_name %></td>
          <td><%= @event.content %></td>
          <td><%= @event.price %></td>

          <% @reservations.each do |reservation| %>
       <table>
        <tr>
          <td><%= reservation.started_at %></td>
          <td><%= reservation.ended_at %></td>
        </tr>
       <table>
<% end %>

<% @reservations.each do |reservation| %>
       <table>
        <tr>
          <td><%= reservation.started_at %></td>
          <td><%= reservation.ended_at %></td>
        </tr>
       <table>
<% end %>













<%= form_with model: @reservation, url: event_reservation_path(@reservation) do |f| %>
    <% end %>
  <div class="field">
            <tr>
                <th><%= f.label :started_at, "ルーム名" %></th>
                <td><%= f.datetime :@reservation.started_at %></td>
            </tr>
        </div>
<div class="actions">
        <%= f.submit "登録" %>
    </div>


    <table>   
        <tr>
            <th>料金</th>
            <td><%= "¥" "#{@reservation.price}" "/日" %></td>
        </tr>

          <tr>
            <th>開始日</th>
            <td><%= @reservation.started_at.strftime("%Y年%m月%d日") %></td>
          </tr>
   
          <tr>
            <th>終了日</th>
            <td><%= @reservation.ended_at.strftime("%Y年%m月%d日") %></td>
          </tr>

          <tr>
            <th>人数</th>
            <td><%= @reservation.people_number %></td>
          </tr>

          <tr>
            <th>合計金額</th>
            <td><%= "#{@reservation.price * @reservation.people_number * ((@reservation.ended_at) - (@reservation.started_at))}" %></td>
          </tr>
    </table>

    <%= form_with model: @reservation, url: new_reservation_path(@reservation) do |f| %>
    <div class ="field">
        <%= f.label :price, "金額" %></ br>
        <%= f.text_field :prce %>
    </div>

    <div class ="field">
        <%= f.label :people_number, "人数" %></ br>
        <%= f.text_field :people_number %>
    </div>

    <div class ="field">
        <%= f.label :started_at, "開始日" %></ br>
        <%= f.datetime_field :started_at %>
    </div>

    <div class ="field">
        <%= f.label :ended_at, "終了日" %></ br>
        <%= f.datetime_field :ended_at %>
    </div>

    <div class="actions">
        <%= f.submit "登録" %>
    </div>

<% end %>

    <%= f.hidden_field :event_id, value: @event.id %>


