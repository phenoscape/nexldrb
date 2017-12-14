require 'nokogiri'

def read_xml(path)
  doc = File.open(path) { |f| Nokogiri::XML(f) }
  return doc
end

def write_json(x, path)
  doc = File.open(path, 'w') { |f| f.write(x) }
  return doc
end

def as_nexld(x, ns = nil)
  cont = x.children.children.select { |z| z.class == Nokogiri::XML::Element }

  if cont.length == 0
    # Base case - contents
    type = x.class

    ## ignore these types
    if ["text", "cdata"].include?(type)
      return x.text
    end

    if type !=  Nokogiri::XML::Element
      return "[" + type + "]"
    end
    out = []
  else
    out = []
    cont.each do |w|
      out << as_nexld(w, ns = ns)
    end

    nms = ""
    if cont.class == Nokogiri::XML::Element
      nms = cont.name
    elsif cont.class == Nokogiri::XML::Element
      nms = cont.map(&:name)
    end

    # # FIXME
    # if nms.map {|z| z != ""}.any?
    #   #names(out) = nms
    # end
  end

  if x.class != Nokogiri::XML::Element
    atts = x.children.map(&:attributes)
  else
    atts = x.attributes
  end

  # node_attr = special_jsonld_attrs(atts)
  # out = node_attr + out

  ## Group repeated elements
  #out = regroup(out)
  return {"out": out, "nms": nms, "atts": atts}
end

ld_attributes = ["id", "type"]
def special_jsonld_attrs(x)
  if x.length == 0
    return []
  end

  if x.class == Array
    x = x[0]
  end

  if ld_attributes.map { |z| x.keys.include? z }.any?
    # FIXME: only add @ to id and type keys
    newkeys = x.keys.map { |w| "@" + w}
  else
    return []
  end
  # special = x.keys %in% ld_attributes
  # names(x)[special] = paste0("@", names(x)[special])
  # r_attrs_to_xml(as.list(x))
end

# special_attributes = ["class", "comment", "dim", "dimnames", "names", "row.names", "tsp"]
# def r_attrs_to_xml(x)
#   if x.length == 0
#     return []
#   end
#   # Drop R special attributes
#   x <- x[!names(x) %in% special_attributes]
#   # Rename any xml attributes needed
#   special <- names(x) %in% paste0(".", special_attributes)
#   names(x)[special] <- sub("^\\.", "", names(x)[special])
#   return x
# end
