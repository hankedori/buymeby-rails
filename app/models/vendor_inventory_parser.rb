class VendorInventoryParser
  include ActiveModel::Model

  attr_accessor :vendor, :url, :category

  def perform
    response = RestClient.get(url, cookie: "build_sha=02fb242044039a31bb68e6a0becbf99a248ff9da; ahoy_visitor=8cb841e8-a6e2-4cb9-83c7-815d4b2b5f05; ahoy_visit=e8c1a35a-f47c-4d60-b82c-13bdaaf6b6e1; ajs_group_id=null; ajs_anonymous_id=%22d4959290-def7-4d1f-ae8c-c93ff88bef46%22; _ga=GA1.2.903095420.1517079538; _gid=GA1.2.1207096093.1517079538; _gat=1; trctestcookie=ok; remember_user_token=W1szMjg3Nzc3M10sIiQyYSQxMCR5RHRRQnIwQnVwUVFHVGkwMVY2U3R1IiwiMTUxNzA3OTU2Ny40NjE1MTA0Il0%3D--7ef665bf06610d446232323ef9f4b0503c1a641a; ajs_user_id=32877773; _uetsid=_uet0af787f3; __stripe_mid=c1ed9efc-92c4-47d5-8d3f-fe0f7a455df5; __stripe_sid=4955fe29-2e94-41c6-a5f8-53aa9ef16df5; __ssid=c4425d26-7f22-4b09-83e9-9b0682de50b5; amplitude_idinstacart.com=eyJkZXZpY2VJZCI6IjE5ZmJlNWUzLWQ3NzctNDdhZi1hNWRlLTI2YzgxYmMxMmY1ZlIiLCJ1c2VySWQiOiIzMjg3Nzc3MyIsIm9wdE91dCI6ZmFsc2UsInNlc3Npb25JZCI6MTUxNzA3OTUzNzg1NSwibGFzdEV2ZW50VGltZSI6MTUxNzA3OTU3OTEyMSwiZXZlbnRJZCI6MTUsImlkZW50aWZ5SWQiOjMsInNlcXVlbmNlTnVtYmVyIjoxOH0=; _instacart_session=T0NERWhjU2IzaHk3RzBTQjQ1V3FueUVTVUphRnNZMGdFQzJnemhWMTlVNjUvZTZiNFdHNkRqRk1FOXVBYzcya1FyL0V3cjlPT2FGSUZSbTBpdHhqdjc0RGZxdW1IazRNNTk4MVVKRDYvUHlDRjNZL25WbEJxM2pmWGRzSzMxeFkwNXdaeFJCZjhxNUxSVEFzRStNeTQ0ZUE1cEVvUXltV3JsOUgvN3VoM2t5L1E2cjJyaEw2WEE1ZmRWclhPWHV0MDF3VXdiVjJ2UVJwcG9laTNuMU9ETEVhNGVNeStqY2UvV0k3YmFIRFFrVUR2QWtNeXB0WXprdEt5OXVsNnZSRGRGTm9Wb3VsQ1NaVGFqcGorL3VPRXc9PS0tZzhIZXg4S041NFBiOUg1QVpIRGQ3Zz09--ff9e913938d68ba3f278db8e82692071186dfaa4")

    JSON.parse(response)["module_data"]["items"].each do |what|
      vendor.items.create!(name: what["name"],
                           price: what["pricing"]["price"].tr!('$', '').to_f,
                           unit: what["pricing"]["unit"] || "each",
                           quantity: 10,
                           description: what["size_aria"] || what["name"],
                           image_src: what["image"]["url"],
                           category: category)
    end
  end
end
