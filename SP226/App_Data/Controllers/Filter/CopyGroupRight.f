<?xml version="1.0" encoding="utf-8"?>

<dir table="userinfo2" code="id" order="id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sao chép quyền" e="Copy User Right"></title>

  <fields>
    <field name="group" disabled="true">
      <header v="Nhóm" e="Group"></header>
      <items style="AutoComplete" controller="UserGroup" key="1=1" check="1=1" reference="group_name%l" information="name$vsysuserinfo.comment%l"/>
    </field>
    <field name="group_name%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="target" allowNulls="false">
      <header v="Sao chép từ" e="Copy From"></header>
      <items style="AutoComplete" controller="UserGroup" reference="target_name%l" key="(@@admin = 1) and (user_yn = 0 and name &lt;&gt; '{$%c[group]}')" check="(@@admin = 1) and (user_yn = 0 and name &lt;&gt; '{$%c[group]}')" information="name$vsysuserinfo.comment%l"/>
    </field>
    <field name="target_name%l" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [group].Label, [group], [group_name%l]"/>
      <item value="111: [target].Label, [target], [target_name%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4mzMfaTxIMPstEF63JJUQodsofwZ33KP8hUWmR2ENKf+5pE5QtOlRvGQt+DrKgbag1kKgdo/Jcyb6TB40TCuaXDVyvbZxwfLWK0L3yT8bBx</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6chuQd+efmhqFzjN3emYzYdtQL8uQqAUvN+8ci3o5D3uEg7kYbLFwQOoF/zzuNd0FE3Iwhkc9CSOzlhvNGfPBlGPPOZ3+z9s5MLIYMhYEgxXISlbIH70xroZcwWKJbMKRSzBVZ5fWpN+80xOTM4txojHjM85S+RB1R8knOsOXlNQdD2i8GBZ4TYwk048WxF6ptaUiLqCWCdbcbAo7sEZY0aac3906KFOJw7QELXThzpeS0bJMMBPn0Fr4g2cA5vV/t3lKaNYADB2Fax8ZuJ2QwiO3TAmWyM84hYqHVMYMCOwO3fKmlDAVLpVFQcbF/MKeA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Pp7JJe0vvY1dpFtr5vgubKDEFGv9m1bnPZK6kaAZZeTosA5jTu311CYCm1Z1fHJyDPUy12NlVMPDIy8wuWf8JPB5C4eOljrmNEdvbuvCW7JY2vjsGAWt6ZdDjcEuEDKzhuNsxsrr3QzENM1MGhW8bgESjhYB7EMpnkzEu6Jp/En8RekJYPx5bXxAPFGAjbsQyNInBXzwXxPAtCWpqmZp9AVXUf5+PdvbyFBmB2/DfmyQughn5PLrWLJD2mYxygi0ZDRAM6nZ2MyaYaFPA/Mb1gIXlhgfc8B0MFOiY9bmaCvN+gReaXZRkudI3pytU27CbNEPkodNEHMbBbNV2VB4OrK3ycHl6zfFOHFdDIstl4wHONNH/1qTUdsxkC3hkGv/g==</encrypted>]]>
    </text>
  </script>
</dir>