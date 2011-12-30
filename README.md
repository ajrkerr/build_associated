A very simple gem.  This allows you to use the following code in ActiveRecord.

```ruby
class PlanSku < ActiveRecord::Base
	belongs_to :sku
	belongs_to :plan_cost
	belogns_to :plan_coverage

	build_associated :sku
	build_associated :plan_cost
	build_associated :plan_coverage
end
```

Tested on Rails3.1.  Use at own risk.
