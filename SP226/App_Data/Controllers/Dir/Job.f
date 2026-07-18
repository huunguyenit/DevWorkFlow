<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identification "Job">
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Job;
  %Control.Unit.Ignore;
  <!ENTITY c "JobUnitDetail">
  <!ENTITY h1 "566">
  <!ENTITY h2 "172">
  <!ENTITY k "ma_vv">
  <!ENTITY i "8">
  <!ENTITY Tag "dmvv">

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;
]>

<dir table="dmvv" code="ma_vv" order="ma_vv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="vụ việc" e="Job"></title>
  <fields>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="&ClientDefault;">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="Mask"></items>
    </field>
    <field  name="ten_vv" allowNulls="false">
      <header v="Tên vụ việc" e="Description"></header>
    </field>
    <field name="ten_vv2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="ngay_vv" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày vụ việc" e="Job Date"></header>
    </field>
    <field name="so_vv" categoryIndex="1">
      <header v="Số vụ việc" e="Job Number"></header>
    </field>
    <field name="vv_sd_pslk" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Theo dõi số dư" e="Balance Tracking"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_nt" allowNulls="false" categoryIndex="1" clientDefault="Default">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" key="status='1'" check="1=1" reference="ten_nt%l" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" defaultValue="0" categoryIndex="1">
      <header v="Tiền ngoại tệ" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" defaultValue="0" categoryIndex="1">
      <header v="Tiền hạch toán" e="Base Currency Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_vv1" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_vv2" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày kết thúc" e="End Date"></header>
    </field>
    <field name="ma_vv_me" clientDefault="Default" categoryIndex="1">
      <header v="Mã vụ việc mẹ" e="Parent Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status='1'" check="1=1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv_me%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" key="status='1'" check="1=1" reference="ten_kh%l" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" defaultValue="''" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_nvbh" categoryIndex="1">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" key="status='1'" check="1=1" reference="ten_nvbh%l" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" defaultValue="''" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="1">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" key="status='1'" check="1=1" reference="ten_bp%l" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" defaultValue="''" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="nh_vv1" clientDefault="Default" categoryIndex="2">
      <header v="Nhóm 1" e="Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" key="status='1' and loai_nh=1" check="loai_nh=1" reference="ten_nh_vv1%l" information="ma_nh$dmnhvv.ten_nh%l"/>
    </field>
    <field name="ten_nh_vv1%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="nh_vv2" clientDefault="Default" categoryIndex="2">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" key="status='1' and loai_nh=2" check="loai_nh=2" reference="ten_nh_vv2%l" information="ma_nh$dmnhvv.ten_nh%l"/>
    </field>
    <field name="ten_nh_vv2%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="nh_vv3" clientDefault="Default" categoryIndex="2">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" key="status='1' and loai_nh=3" check="loai_nh=3" reference="ten_nh_vv3%l" information="ma_nh$dmnhvv.ten_nh%l"/>
    </field>
    <field name="ten_nh_vv3%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ghi_chu" rows="2" categoryIndex="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="2">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    &UnitFields;
  </fields>

  <views>
    <view id="Dir" height="232" anchor="&j1;">
      <item value="120, 100, 330"/>
      <item value="11: [ma_vv].Label, [ma_vv]"/>
      <item value="110: [ten_vv].Label, [ten_vv]"/>
      <item value="110: [ten_vv2].Label, [ten_vv2]"/>

      <item value="110-11: [ngay_vv].Label, [ngay_vv], [so_vv].Label, [so_vv]"/>
      <item value="111000: [vv_sd_pslk].Label, [vv_sd_pslk], [vv_sd_pslk].Description"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110-11: [tien_nt].Label, [tien_nt], [tien].Label, [tien]"/>
      <item value="110-11: [ngay_vv1].Label, [ngay_vv1], [ngay_vv2].Label, [ngay_vv2]"/>
      <item value="110100: [ma_vv_me].Label, [ma_vv_me], [ten_vv_me%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      &UnitViews;

      <item value="1101: [nh_vv1].Label, [nh_vv1], [ten_nh_vv1%l]"/>
      <item value="1101: [nh_vv2].Label, [nh_vv2], [ten_nh_vv2%l]"/>
      <item value="1101: [nh_vv3].Label, [nh_vv3], [ten_nh_vv3%l]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 110, 120, 100" anchor="&j2;">
          <header v="Thông tin chính" e="General"/>
        </category>

        &UnitCategory;

        <category index="2" columns="120, 30, 70, 330" anchor="&j2;">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1ciT9Y3mHUuJo6DJRhWBVE20/eH67fHyO8ILj98DAe4QeJYzZ5CYlVYtB+GS7UpisM=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qfVsx+TenqtzP4O1B2ZDFqYcDeaIqT/V8leUxo7I/CBKCYpadqIV1f3qOaeXN9CGEA=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjLMHgerKrDpMOBCyX4NjAeRz4TS0i2l/kMf6oMxc2DnfWwmX5Lgg0FqV+SfvreNe0dpWBgvnVUp3prAPxtIGJXk4K0YAF77DUF86hMBjNfpxPjb1PDPIDaU+pQ5DZhsbSS8KrS5iHbwAWEAbIytR+k51EHFiO400qxxk1aOAKyr+A==</Encrypted>]]>&Job.Nested.Message.v;<![CDATA[<Encrypted>&q0x/DRPtnEN53dA6mwugdjDO2FhHZQDD7nim1n8uJSXrzz7cwiJXFqwWTKnxyOQ6zN1gz797W/hsJIUIBuXKC8WaiAoAHd8LMIr0S0+O8avuOkwdQZn68YOQ9zyVQ+FTFhGzD0/JCwSDeOVH0a6l4w==</Encrypted>]]>&Job.Nested.Message.e;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz6nmWt1Ha4WW/5tuOA5WB8AA/T8l3rbtgCtunFekX+1f8hmBA8rQLd0Zf+s22+/+2cXlhK+O3jwXWuw+KS3REZUwusscMnVSSLLzah1UI97THJaUmz5X8LXP1bOQpsCB/CVYwv7+bMUyXnFWTHSl0p2UOx7/yoMuPIlDKoOIYzOaD5rfzKUd5WA6U43lLpJHHH5Y/5gWahP8Jfztvi/lEtzgkxGvy6tlCE/JCzVlP1hx/YJoY9s2sZPUpUAcBiWwPoXFrkQxAJTHjmxJYkwPaPQVSnHq5zQa6XX7zaNUrpXyAReFHs7zivEm7nM7EY0LLlPQrNwPHIkmOvY0egphJvqGw8+pXGBc0WK+9suPIKfy+xiBUgbe1LW5s6R6f2GN3YEdPJERtwTnz9Sh2GwasY1S8RBwoXsDLHZvzgzE6O/nbpLeZbav4TUQ6asULNompUXwQ4neCAwiWvFArrmSXq7HN5b0ZjUdl74MddNg4RhQlHDiHdFmK0UsDakHfcYM16crAE3q/jKR/xw9bhO3fZc=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU7vMRJi5phIo/q55KJkMZKQ==</Encrypted>]]>&Job.Nested.Key.a;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUPYKlVPhp/AatR3wB/dhJuD91CIuhDMwlF+MPtYyZ2CprL1vaDVlCJ7zsNmEnpZBQbmfQoqBvBbYLXjLaBNHgahTTUSGb9HhMCtH+60h8DvWw==</Encrypted>]]>&UnitBeforeInsert;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYB74MK6vr2F1KE/dz/+QvzDcL2uJJO9Ogl6CL18nBwMxIzCp6ONAm5MXgT9hAm5TDp9gKkHvve57mgmSqrHVI=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &UnitPostInsert;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLbyz7VVPN8w4ZLydmzT6nfKrLslxTF4lEhaFX5GDQ3xR4VBmi6roNuBtwmD6Z2W2BQKJvPcU4TmHvs4/cx11sRMdj1ZWGURtoEOoePYwVgrLcOQslL65EUg6d3YkgRu+42U+hMuCMjvGsqxUSFrvPYcHQQ6rGBkWCO/YzH3uaR/1Laz86tLZDOpDU/j5NjMbP</Encrypted>]]>&Job.Nested.Key.a;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVLd3oAF18bctO6psVcQ1bb5lurh85E5ry88B+AE+1DwtL1Vog8jyKBXpm+hjSioOnedbaghJUjhTybZznssqvB1K2NDQiPAlmSppiNO40yml6X3TgwkQMcxHi9/+j4rWfx0yDGK+S9t8+8ORHvcwvVKlZxvZBwtBXkBYAiZvNvJwbq02hrvjrtgX9378gBfnvP15qESfA6e9Wx5ro6Jk2BF5ByWKLN3PteRv7/1hIKyjG/Ug2Adyw9771bvBWm4h5ISByU3j4vAerEmjVKibvj6+WOOOW9T02G0rGm34P3KhFoAmwZJbXqTs9X7znrtPgc8Y262AVSDaxo6v87LHbSaxf7OM5vEdqNiS/L7O55UM</Encrypted>]]>
        &UnitBeforeUpdate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVynUmttU0JZwsWPL4gM7ISQHx0PJBTNCaVYSBiyY6zoE</Encrypted>]]>
        &UnitPostUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmlX/1G4VEF8z4pOWdpqPPKEZpLXua7Laz/vu9gWWLySVgtgIPPBM/N87GKpq/tLvfqvXDrwtn9detpr22st7eNeSMEyXEfiUteUMAK8PTD+DkwY2f/5hWf9JEcstWSFP+4EkQzbLkEjTH0bPU3BOrgRGufvUYmejl5UlGHlJRMusKm4oGd2YTs9V7wsWlASWuLCgJEep6LIBfU8KOgIb6S0XGi7INKGOOL+3g19O/fGw==</Encrypted>]]>
        &UnitPostDelete;
      </text>
    </command>

    <command event ="Checking">
      <text>
        &UnitCheck;
      </text>
    </command>

  </commands>
  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SCO9kehimTPDbj6T8xCrPWqAfHoOJ714UmN681T5tpg</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjEl3sRejzPKt+1XqSsvkpxLf/a2Y7g6v+4+/vegk2hA+/eNAiuZ8CfuyNTgG34N6D1Rz/GUuhaHMdtFCIo4Z/lE=</Encrypted>]]>&UnitTab;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/785gqrEj2vU7l/mOwg9Wp3/GizT6RDjW2/1jC1PUiRuXIeZRWrZd/KR42TS06wjDnBXmw9ZQFcCw1PMSi+69aK5EsS5ZOoZdbdvQHUFmITZ4RsuiaNd2Xef9hGeinIaUA0igq6FiVgtJFm/JMCuTaRpUn1B6yFZZyU8tEDEgftphmD5QW9vO2HdYE3CQ66lh2yEdWZYRiBjyg8HGXgmzpxQY=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFydQyDJEWQcT9b3p7KM5oA/A3nV5KYBwq2DDJUPhG8RPSetxHiHKE3f/2NJBDyOYzMpIDXgTP3MWBejlDYD2cj40Du+29Ma01uA+HZFnPqtH3JR3ZIIz9NaG4koiR8IaVZKFsI+EnRwXIfcCxZmGgVJI=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFySG6TtBGaksaEw8ylGxrgDRbDZFAzIA3X1qjoEbHr31fGZSHCQ637vQGPSShFUXkuS8SeuEDzOc2mBFWovT0TDnimV0f581RIBsHzzaHtKsPblcSMcaLYUiabRQpy9mfW1UWrsGit4DNGhXL+/0ZsUlA+Uub2MAQOX0OXn2r+Zv3r5PdEafAKirK/pfacq/uMVZwvUtxHTs9Jc58MtrRaEjtfRhAcQUAj9WkyKix4LpNDe7lSDKmy40jjf7sxVxGg4ilOvjiFULgJ7+oSYRjCtFs8T0CU+LbZgVptNefise3wVGZni6XVP9zMyJFT9LxIw==</Encrypted>]]>
      &ScriptSuggestion;
    </text>
  </script>

  <response>
    &XMLSuggestion;
  </response>
</dir>