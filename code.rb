files = Dir["/*"]
code_for_site = []

files.each_with_index do |x, y|
  y += 1
  file_path = x.split("/").drop(5).join("/")
  file_name = x.split("/").drop(5).last.split("_")

  if file_name.length >= 3
    patient_age = file_name[1].to_s
    procedure_recovery = file_name[2].to_s.split(/\s./)[0]
    p file_name
    p patient_age
    p procedure_recovery

    if y == 1 || y % 4 == 0
      code_for_site.push("</div>")
      code_for_site.push('<div class="row">')
    end
    code_for_site.push('<div class="col-lg-3 col-md-4 col-xs-6" style="margin-top:25px;"><a href="'+file_path.to_s+'" data-title="PROCEDURE: Brazilian Butt Lift <br> AGE:' + patient_age + ' <br> RECOVERY: ' + procedure_recovery + '" data-lightbox="Brazilian Butt Lift"><img src="'+file_path.to_s+'"  style="height: 125px !important; width: 175px !important" class="img-responsive img-thumbnail"></a></div>')
  else
    if y == 1 || y % 4 == 0
      code_for_site.push("</div>")
      code_for_site.push('<div class="row">')
    end
    code_for_site.push('<div class="col-lg-3 col-md-4 col-xs-6" style="margin-top:25px;"><a href="'+file_path.to_s+'" data-title="PROCEDURE: Brazilian Butt Lift" data-lightbox="Brazilian Butt Lift"><img src="'+file_path.to_s+'"  style="height: 125px !important; width: 175px !important" class="img-responsive img-thumbnail"></a></div>')
  end
end

File.new("test.html", "w+")

File.open("test.html", "w+") do |f|
  f.puts(code_for_site)
end
