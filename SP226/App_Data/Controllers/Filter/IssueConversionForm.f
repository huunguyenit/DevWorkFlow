<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="userinfo2" code="name" order="name" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xác nhận" e="Confirm"></title>
  <fields>

    <field name="user" external="true" defaultValue="''" allowNulls="false">
      <header v="Người chuyển đổi" e="Converter"></header>
    </field>

    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1ts36golF8ur4r4Qnq6lRtP5I+LMRVVTCDYR0bnCpItFqWuqxrcCE50IrrGzdMoOWqQ==</encrypted>]]></clientScript>
    </field>
    <field name="chkpass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230, 0"/>
      <item value="110: [user].Label, [user]"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1b1Z6DQVvjDrs5T4h/4lG0CbjVbO1W65i0NV6HTl4uq96Ka83wyfxfP7iPuy3gYnLVq6ifEmRiV7J23CXMD8KUAMoHhVVED7RXXtz0IbvbpSwOZ3Z899Y5R2B/QdxZF6xKJKXqHy7i5Q01UQ4M4Fekt+huAH2jR2gjCU6PZ3EcWLoeB6gKe1AOuEfghOT9QjcZjWu6rqKPDXakCbk2LEjAO2Ff9iSI+6utjDPbAR4uRdGLfKiutH6iYM8fJhj6m8=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf17SB624yUQlLPN9Ubj+9HxP0fz4MjycPzxMWD43kFv1iXLAaQom9yfKaiLJNYQT2ffWnLPBn6soodgzhQ7SNeU=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70LBBxTxVo2wdYrIJzAd/YcC9NbpJekWxiFVMLD+8Fr07zui+H1rtFtE/S5Ue4r54P1Avbx4zOI3lZBShVhS88+uKH64YtRGOVOqSUZXemezYSI1H2bbDJ8aJWDsgqZKpQO0UcCjvQlFPTkpesLrH6DrubSZ1X3lNVlZ6JhxxnY7Rc6rHlP5igLEWDgeTRqh7JxgCwnwqILowDyiby7bFlyo=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%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</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5cBdf+Y6fnghL241kyDz6YVX/jV68KjRqPZfYObLs198eJ7N163RjkeuXcCXYvGag==</encrypted>]]>
      </text>
    </action>

    <action id="CheckKey">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dXWbZTKDy+Sko210bcGJP4a/mEFUDlN56pJkixuOCUyrFPvRvXgSUA8i1DhsSg2+9ZVW6k7iEDAm9VMmb8h5MGloZ8pSKTb8nDKVpp6yb5Vw88JsMFZqID/6sSnaYwfERSxWwBjQ2Fz8GyIYmjcitMxQVXXqzUpMIkbQ7VA2+aIZJfKRLvVitWiha+xRl2ZXGSbO5jhetG2ck0bqCz2Dy4=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>