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


