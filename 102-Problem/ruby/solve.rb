require_relative "../../shared_ruby/euler.rb"


def inside_triangle?(a, b, c)
  # Compute vectors
  v0 = [ c[0] - a[0], c[1] - a[1] ]
  v1 = [ b[0] - a[0], b[1] - a[1] ]
  v2 = [ -a[0], -a[1] ]

  # Compute dot products
  dot00 = v0.dot(v0)
  dot01 = v0.dot(v1)
  dot02 = v0.dot(v2)
  dot11 = v1.dot(v1)
  dot12 = v1.dot(v2)

  # Compute barycentric coordinates
  invDenom = 1 / (dot00 * dot11 - dot01 * dot01)
  u = (dot11 * dot02 - dot01 * dot12) * invDenom
  v = (dot00 * dot12 - dot01 * dot02) * invDenom

  # Check if point is in triangle
  (u > 0) && (v > 0) && (u + v < 1)
end

txt = File.read( File.dirname( File.expand_path( __FILE__) ) + "/../downloaded/triangles.txt")

puts txt.split(/\n/).inject(0) { |sum, line|
  nums = line.split(/,/).collect(&:to_f)
  a = nums[0..1]
  b = nums[2..3]
  c = nums[4..5]

  if inside_triangle?(a, b, c)
    sum + 1
  else
    sum
  end
}
