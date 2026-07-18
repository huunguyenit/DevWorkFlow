<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "hrInsInfChangesInput">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_dl" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" align="right">
      <header v="Nguồn dữ liệu" e="Data Source"></header>
      <footer v="1 - Tăng mới, 2 - Nghỉ việc, 3 - Nghỉ, vắng mặt" e="1 - Increasing, 2 - Job Leaving, 3 - Annual Leave or Abbsent"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZW1mTFPFcPayVYn7iIEgPQtcsUyPI9t4dn9zl4NLq+98</encrypted>]]>&Identity;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh32tqifjGwiTSFBRTXaGtUzR6vABFCfaHqr6C2ga51zZM</encrypted>]]></clientScript>
    </field>
    <field name="bo_phan" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZW1mTFPFcPayVYn7iIEgPQtcsUyPI9t4dn9zl4NLq+98</encrypted>]]>&Identity;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh36yHj7ULvxCl3XeSIp2Cbek8EJQfTf0fG0XzFPaCgi4H</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="dot" type="Int16" dataFormatString="#0" clientDefault="1" defaultValue="1" allowNulls="false">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>

    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày đến" e="Date to"></header>
    </field>

    <field name="ma_loai">
      <header v="Loại nghỉ, vắng mặt" e="Leave Type(s)"></header>
      <items style="Lookup" controller="hrLeaveType" key="bh_yn = 1 and status = '1'" check="bh_yn = 1"/>
    </field>

    <field name="loai_thay_doi" allowNulls="false">
      <header v="Loại thay đổi" e="SI Change Type"></header>
      <items style="AutoComplete" controller ="hrSIChangeType" key="(('{$%c[ma_dl]}' = '1' and exists(select 1 from hrdmktdbh b where hrdmltdbh.loai_td = b.ma_kieu and b.tinh_chat = '1')) or ('{$%c[ma_dl]}' &lt;&gt; '1' and exists(select 1 from hrdmktdbh b where hrdmltdbh.loai_td = b.ma_kieu and b.tinh_chat in ('2', '3')))) and status = 1" check="(('{$%c[ma_dl]}' = '1' and exists(select 1 from hrdmktdbh b where hrdmltdbh.loai_td = b.ma_kieu and b.tinh_chat = '1')) or ('{$%c[ma_dl]}' &lt;&gt; '1' and exists(select 1 from hrdmktdbh b where hrdmltdbh.loai_td = b.ma_kieu and b.tinh_chat in ('2', '3'))))" reference="ten_loai%l"></items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_thay_doi" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày thay đổi" e="Change Date"></header>
    </field>

    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" hidden="true">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="111000: [ma_dl].Label, [ma_dl], [ma_dl].Description"/>
      <item value="1101001: [bo_phan].Label, [bo_phan], [ten_bp%l], [bp_ref]"/>
      <item value="110---1: [dot].Label, [dot], [nam]"/>
      <item value="1101--1: [date_from].Description, [date_from], [date_to], [ky]"/>
      <item value="11000: [ma_loai].Label, [ma_loai]"/>
      <item value="110100: [loai_thay_doi].Label, [loai_thay_doi], [ten_loai%l]"/>
      <item value="110: [ngay_thay_doi].Label, [ngay_thay_doi]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2n4f7jl0jX8hzbsWRhvYc+On9S5oefEl6iw4NanziAh</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%QUk/b2XzXW4SkIBsdbQxE1NwhjU2d+LouqdjSH6bH6Uq0uyfflTXYPOO3vQV1wCI73tImSpWphBr4GKxdsMDNF63VAV8zeTjTX6Pu+jOUIiO0c4AoLHr+GdfwBnhYcpywE+bktJkAuiARS/VbG7KcAKh5NzwoTXjAH+4DVi/aLMTI0IJq5i1+/XaEhzL0SCMeXpsXWMNTpWaMUbhV8bU9UprDNnQY3Kfknh8Q/dDTdE=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WqToegKG5LCmTzMwRxipKmbDSQ6OxHJOyhbWkmL3TDjVi0FWALo2sEY2H+XPJy8fg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNrUrAiffDy1/u4VVqG34lbCU1/ipNaFzYsNUSle+Z29xzotnVZ92wwUJkQcaF0zKNd9Ue2AB7XPSVv1Ifl2rWEdkTWkjBzx8KNzNdOKdObIJCVY/xN1YuNnS2vl3VOFGdmT2h26gBAjMxGLjmJSdPj00oUnhw1TGwuEclaJdrknanlfExmeqE9MkEau5DWWdT4/UKymtoyaew0MeDSxaHKtyu33FZ7zCmg4u5BTTDcs</encrypted>]]>&Identity;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh37NHSOgqEzNaW7vlbLFVXvdBJ/NnhKNiX7VVyAEvuNkNwi28aSNGp5SdkNMAdgoDGm5LtA8TnsJZNSBfmaa6ay0=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0YlPEkEhSrEuY5pBYUlEoc5CJV+Qb8xiGsU7hhkqT74ipUSZsD295l+nfeXkQa7PMg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfIeVkwsumXazuM4SZLvv/LQsV6CVelrJyOleUwhZ0dKPLr/9XBWPq7F+AAGIryxLROs1iRYanpRSaOhLhggHXv4=</encrypted>]]>&Identity;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3xxtZh2DwdwwKG/7HolInFHBeU4OOos9C81m1/UIFjeOztUlaFeaJwGIk0LdTgL0kC6rl2LGz3WCzVCJf2zdfI2Zlg6ajhe8yrbc4DVIQ5801/ilr3eb6p1GMtqwtK6ngA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh38l95GfRXHU7oTWvE/8KbmT/pg8Rr1K2LR6YE9leXi8K9U+rd4FLwwhBnolbvAdVB/ux+GoQmcp5OQuwBnK53o3ylDAK8O/LxZ1jmZdEnR4anwDJZD8ftOPlqaRGjuUYq1rfnoi41jjwJXz58xpMdI/0DEuctq8aG8+slNw1X2/ZBqXMVm/a/h6VbHL2+NkTGCbZJZieso/Y7qfOBzWOtoJdstW0JB56YQL23h2pQJmD</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfCP296pKBalKUNxwEp9xtIUOVoLDXukVs3aJx6k42PvkPJ07oj/kAY2/EgYfXsncdPRw7yuIrLDhK5G4xXEgSDwqz3yhbRj9AW0C6RDC0mRqrRhQB1S0qq64E0LD1cI+SOD7tUhMC4vsetuQZkH1Qu4pe0SO9wg6QnJ4m1GewkTmRu/0bJcvVwJmR6tX8syQCFsvTBzeqmHIc4zQmWSJBMMie1b8FymC8TIRol9oZnmMze4CyAK0+FnXuvKJYM2BA8pK87/6LkFSoVjkigiiZu5q2TFdOvS5xqhIecf9pDUlRPMIe1+BcsmQf/YEimNjJ+hkNuHF4bCZB3LTAeFqp/Ssl4naYJOVT+sh0t8toPmzokhgTbC1jvRzZsIT7s74Dw4jNoqBg+MQX4ZuzpKtMKzNJje+YE5uC4S7Pjg5m0x17HgCA0PNAuOgAIdWQs/QQCA0+yOMMRjD+c/9i/c6nYSdCPmYif34GOAFcuunh0WShSFhTT/U5w//0XUv+/35ykLh3C/ikVYee1ZumoFdkEmMMBdcU8ef5Ii7F5v07c6MRbiwe6tGcJhUBD2ty3Ra9WWYCHpPzC39JvH41OgLvWnTj8twvE/TwcGlbK5uanX9</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5AnMsH6nWz5jWh8N7/f2bQkgLsQYVSpqEemRHWTf1mhj/Zta8wLN8KCPgPSXbL9YK0BJAPffxD1MADDJJcormBMMT0yYGS4j09QGJxDSsoQg==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>