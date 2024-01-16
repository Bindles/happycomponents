<div id="color-circles">
  <% @colors.each do |color| %>
    <div class="color-circle" hx-get="/colors/<%= color.id %>"  hx-swap="#mydiv" hx-target="#aaa" hx-headers='{"HX": "true"}'>
      <!-- Display your color circles here -->
      <%= color.name %>
    </div>
  <% end %>
</div>

<div id="aaa">
  <!-- This div will be updated with the selected color's name -->
</div>