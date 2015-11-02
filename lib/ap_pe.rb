require_relative './bodies'

class ApPe
  attr_accessor :body
  attr_writer :v, :r, :zenith
  attr_reader :semi_major_axis, :e, :ap, :pe

  def initialize(body, v = nil, r = nil, zenith = nil)
    @body   = body
    @v      = v
    @r      = r
    @zenith = zenith
  end

  def v
    @v.to_f
  end

  def r
    @r.to_f * 1000 + self.body[:radius]
  end

  def zenith
    @zenith.to_i * Math::PI / 180
  end

  def calculate!
    return if @body.nil? || @v.nil? || @r.nil? || @zenith.nil?

    @semi_major_axis = 1 / (2 / self.r - self.v ** 2 / self.body[:gm])
    @e = Math.sqrt((self.r * self.v ** 2 / self.body[:gm] - 1) ** 2 * (Math.cos(self.zenith) ** 2) + Math.sin(self.zenith) ** 2)

    @ap = (self.semi_major_axis * (1 + self.e) - self.body[:radius]) * 0.001
    @pe = (self.semi_major_axis * (1 - self.e) - self.body[:radius]) * 0.001
  end
end

