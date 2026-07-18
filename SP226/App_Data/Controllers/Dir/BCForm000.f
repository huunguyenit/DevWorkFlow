<?xml version="1.0" encoding="utf-8"?>

<dir table="biform" code="form_id" order="form_id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo mẫu" e="Form Definition"></title>
  <fields>
    <field name="form_id" isPrimaryKey="true" disabled="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="c_acc">
      <header v="Ds tài khoản có" e="Credit Account List"></header>
    </field>
    <field name="d_acc">
      <header v="Ds tài khoản nợ" e="Debit Account List"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 390"/>
      <item value="11-: [form_id].Label, [form_id]"/>
      <item value="110: [c_acc].Label, [c_acc]"/>
      <item value="110: [d_acc].Label, [d_acc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxWtzlYIBlgIM9Fgu/fn4jXLMYFNRSD+iC8KN6EIjGAiy1jy1khB/oGmrZnRhk269mn3nukW1Am/SgOWFS6TBSU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70L+rGgfeB+Hxzj5C5ZFgGFOoQK5veEyKjf9LE5UAR+xN9BPY9VPCBMiy+Uq0RqKjamWzkbktGc83rjV6n++TEm6Uhb8ky93UOpWGqMyMmI/tlxWXrIo8axOELosopGbw50OwcDBhiAbsahRRuq7AZeWVMY3yN5hzKZwz62/z8pqpie0ngFVM4w3/MclpaE0q+jYLn9WO+m+Z7U9ew4e2nLP+4BrB5DAJhrmC21H/7penuYvkavhAhtuFvhpXk7vmKyNwKkmiqDBR2h+Xviel2Tw=</encrypted>]]>
    </text>
  </script>

</dir>