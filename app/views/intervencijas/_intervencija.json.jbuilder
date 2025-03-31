json.extract! intervencija, :id, :datum, :lokacija, :tip, :kratek_opis, :podrobnejsi_opis, :created_at, :updated_at
json.url intervencija_url(intervencija, format: :json)
