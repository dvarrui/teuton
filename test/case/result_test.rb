#!/usr/bin/ruby

require "minitest/autorun"
require_relative "../../lib/case/result"

class ResultTest < Minitest::Test
  def setup
    @result = Result.new
    @content = [ "line1","line2","line3" ]
    @result.content=@content
  end

  def test_eq
    filter="line"
    r=@result

    r.content=@content
    assert_equal true, r.grep!(filter).size!.eq(@content.size)
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal true, r.grep!(filter).count!.eq(@content.size)
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal true, r.find!(filter).size!.eq(@content.size)
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal true, r.find!(filter).count!.eq(@content.size)
    assert_equal "find!("+filter+") & count!", r.alterations

    r.restore!
    assert_equal false, r.grep!(filter).size!.eq(0)
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal false, r.grep!(filter).count!.eq(0)
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal false, r.find!(filter).size!.eq(0)
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal false, r.find!(filter).count!.eq(0)
    assert_equal "find!("+filter+") & count!", r.alterations
  end

  def test_neq
    filter="line"
    r=@result

    r.content=@content
    assert_equal false, r.grep!(filter).size!.neq(@content.size)
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal false, r.grep!(filter).count!.neq(@content.size)
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal false, r.find!(filter).size!.neq(@content.size)
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal false, r.find!(filter).count!.neq(@content.size)
    assert_equal "find!("+filter+") & count!", r.alterations
  end

  def test_grep_array
    filter1=["l","i","n","e"]
    filter2=["l","i","n","e", "s"]
    filter3=["l","i","n","e", "1"]
    r=@result

    r.content=@content
    assert_equal true, r.grep!(filter1).size!.eq(@content.size)
    assert_equal "find!(l) & find!(i) & find!(n) & find!(e) & count!", r.alterations
    r.restore!
    assert_equal true, r.find!(filter2).size!.neq(@content.size)
    assert_equal "find!(l) & find!(i) & find!(n) & find!(e) & find!(s) & count!", r.alterations
    r.restore!
    assert_equal true, r.find!(filter2).size!.eq(0)
    assert_equal "find!(l) & find!(i) & find!(n) & find!(e) & find!(s) & count!", r.alterations
    r.restore!
    assert_equal true, r.find!(filter3).size!.eq(1)
    assert_equal "find!(l) & find!(i) & find!(n) & find!(e) & find!(1) & count!", r.alterations
    r.restore!
    assert_equal true, r.find!(filter3).size!.eq(1)
    assert_equal "find!(l) & find!(i) & find!(n) & find!(e) & find!(1) & count!", r.alterations
  end

  def test_grep_string
    filter="line"
    r=@result
    r.content=@content
    assert_equal @result.grep!(filter).size!.value.to_i, @content.size
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal @result.grep!(filter).count!.value.to_i, @content.size
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal @result.find!(filter).size!.value.to_i, @content.size
    assert_equal "find!("+filter+") & count!", r.alterations
    r.restore!
    assert_equal @result.find!(filter).count!.value.to_i, @content.size
    assert_equal "find!("+filter+") & count!", r.alterations
  end

  def test_grep_string_filter_1_item
    filter="line1"
    r= @result
    r.grep!(filter)
    assert_equal "find!(line1)" , r.alterations
    assert_equal [ "line1" ] , r.content
    assert_equal 1, @result.content.size

    assert_equal 1, r.grep!(filter).size!.value.to_i
    r.content=@content
    assert_equal 1, r.grep!(filter).count!.value.to_i
    r.content=@content
    assert_equal 1, r.find!(filter).size!.value.to_i
    r.content=@content
    assert_equal 1, r.find!(filter).count!.value.to_i
  end

  def test_grep_string_filter_0_item
    filter="line9"
    r= @result
    r.grep!(filter)
    assert_equal "find!(line9)" , r.alterations
    assert_equal [ ] , r.content
    assert_equal 0, @result.content.size

    assert_equal 0, r.grep!(filter).size!.value.to_i
    r.content=@content
    assert_equal 0, r.grep!(filter).count!.value.to_i
    r.content=@content
    assert_equal 0, r.find!(filter).size!.value.to_i
    r.content=@content
    assert_equal 0, r.find!(filter).count!.value.to_i
  end

  def test_grep_regexp
    filter=/line[123]/
    assert_equal @result.grep!(filter).size!.value.to_i, @content.size
    @result.content=@content
    assert_equal @result.grep!(filter).count!.value.to_i, @content.size
    @result.content=@content
    assert_equal @result.find!(filter).size!.value.to_i, @content.size
    @result.content=@content
    assert_equal @result.find!(filter).count!.value.to_i, @content.size
  end

  def test_grep_regexp_filter_1_item
    filter=/line1/
    assert_equal 1, @result.grep!(filter).size!.value.to_i
    @result.content=@content
    assert_equal 1, @result.grep!(filter).count!.value.to_i
    @result.content=@content
    assert_equal 1, @result.find!(filter).size!.value.to_i
    @result.content=@content
    assert_equal 1, @result.find!(filter).count!.value.to_i
  end

  def test_grep_regexp_filter_0_item
    filter=/line9/
    assert_equal 0, @result.grep!(filter).size!.value.to_i
    @result.content=@content
    assert_equal 0, @result.grep!(filter).count!.value.to_i
    @result.content=@content
    assert_equal 0, @result.find!(filter).size!.value.to_i
    @result.content=@content
    assert_equal 0, @result.find!(filter).count!.value.to_i
  end

  def test_reset
    assert_equal @content[0], @result.value
    @result.reset
    assert_equal nil, @result.value
  end

  def test_restore!
    assert_equal @content[0], @result.value
    @result.count!
    assert_equal 3, @result.value.to_i
    @result.restore!
    assert_equal @content[0], @result.value
  end

end