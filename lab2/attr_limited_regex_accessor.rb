def attr_limited_regex_accessor(symbol, regex)
    class_eval %{
        def #{symbol}
            @#{symbol}
        end

        def #{symbol}=(new_value)
            if new_value != nil && new_value !~ #{regex}
                raise "invalid #{symbol} format"
            end

            @#{symbol} = new_value
        end
    }
end

def attr_private_limited_regex_accessor(symbol, regex)
    class_eval %{
        def #{symbol}
            @#{symbol}
        end

        private def #{symbol}=(new_value)
            if new_value != nil && new_value !~ #{regex}
                raise "invalid #{symbol} format"
            end

            @#{symbol} = new_value
        end
    }
end

def attr_private_accessor(symbol)
    class_eval %{
        private def #{symbol}
            @#{symbol}
        end

        private def #{symbol}=(new_value)
            @#{symbol} = new_value
        end
    }
end