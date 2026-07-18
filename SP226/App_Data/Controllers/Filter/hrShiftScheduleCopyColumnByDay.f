<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="hrca$000000" code="stt_rec_nv" order="stt_rec_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sao chép theo ngày" e="Copy By Date"></title>

  <fields>
    <field name="ngay" type="Decimal" dataFormatString="#0" allowNulls="false">
      <footer v="Ngày/tháng sao chép" e="Source Day/Month"/>
      <header v="Ngày sao chép" e="Source Day"/>
      <items style="Numeric"/>
    </field>
    <field name="thang" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Tháng sao chép" e="Source Month"/>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv2">
      <header v="Sao chép từ nhân viên" e="Source Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv2" key="(@@admin = 1 or (bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_nv2" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay2" allowNulls="false">
      <header v="Sao chép cho các ngày" e="Target Days"></header>
    </field>
    <field name="thang2">
      <header v="Sao chép cho các tháng" e="Target Months"></header>
    </field>
    <field name="ma_bp2" allowNulls="false">
      <header v="Sao chép cho bộ phận" e="Target Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp2%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I9uB4+Nhkf3VOM/lkG7FE0kYHIcBH3qKXmo2zI8VYP+/L5zUem/DuH8HtPw3Ol43Xp90WCl++N6f3bxn6LEv+I=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv3">
      <header v="Danh sách nhân viên" e="Employee List"></header>
      <items style="Lookup" controller="hrEmployee" key="bp_ref like case when '{$%c[bp_ref2]}' &lt;&gt; '' then '{$%c[bp_ref2]}%' else '''' end and status = '1'" check="bp_ref like case when '{$%c[bp_ref2]}' &lt;&gt; '' then '{$%c[bp_ref2]}%' else '''' end"/>
    </field>
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" hidden="true" readOnly="true">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" hidden="true" readOnly="true">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="ma_bp" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref2" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 230, 0"/>
      <item value="1101111: [ngay].Description, [ngay], [thang], [tu_ngay], [den_ngay], [ma_bp]"/>
      <item value="1100101: [ma_nv2].Label, [ma_nv2], [ten_nv2], [ma_nv]"/>
      <item value="1100011: [ngay2].Label, [ngay2], [ma_vtr], [bac_ql]"/>
      <item value="11000--: [thang2].Label, [thang2]"/>
      <item value="1100101: [ma_bp2].Label, [ma_bp2], [ten_bp2%l], [bp_ref]"/>
      <item value="1100001: [ma_nv3].Label, [ma_nv3], [bp_ref2]"/>
      <item value="111000: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMUMGaUb9sqzhcvJsBEUvrg1WYmizp/pfWzwaCv4PwXAzbfktGOLbrR853MBQafNNWKZUYjF49prdP5UvkN5IjPVbkNK+/K7+VE+cJQfMR/C</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMt1oHfmSZ/Mwp4FHr/BqIwpgQuQ9ZpzuIW6I1na8k+QavJ/riT2R/8xrdXsH+ILPE4R3RwslhsstpcMKHyhaJPvYFkfMPw/4h1Nyz60LIwU</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTzqMI4HZEaHd24iL+EorCSwLDiShLs/RPTsOb8mhfBjUwLFcdPOmTjycoKfDcQKqyuzXE3p5QvRuR483Le5KYbkXacP+0spQWPPcOQ/tqRc9uRuTtbVMhktDd5WCPcgnI2L1yPCZAXrWqdFoJGiENf</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2ESp05za1KZD7FA4JFeI2aMPl6nL7HEl1WOeYV5h1eRVC5UGQFsmGKHkbQ17HbIUXoW9aCDiapl1vOex0OR/VhDG76NfY3RDW/CYBZFob6gMp5DJY/kj9SiANLSf1c+WVQ3pmJS3qoYhDGohbpwjWGu5B7ZZ+W5erxefXGz8dxpFlqF3CGRoW+fnLAwbY/5Oj4Pm9Mc/gRjby/OyovFE3FF7IZHs59FbAqekC7PoIQ7rTDahQw25IQdkv/FY7cdhA3dv/q5KOJ7CT4NUgOPwo672EWk9Ul4NSqV2EIcMPgiDXGWdWBzhepH04M0Y+lYTrPaW6Ccddhd+7PVsUmgzJxRNJq2wLNfO6U0YgwAnILYwJW0FzWi6KmCj6buDkWqhGzC+ysfxguLZc6k6tJMCPzJ3i46nU9nwQ25dQZMAc1Y/rYFmipILFK8JjPkyd00QsktnbVSq8ogq3tsk6YbQtySRD7ROhPcgyUUfbFPeur1JHfUuf2/4Qt4rMpqlS5dVyi+/q4KrWhhPV7suuFFnOVKf09EK9XQvn0m5vXaPsSLIJQbavacsl7VKcWsZqFDHly8KwjViPeQxP7cbNeEFp9TTbhw1vLK2lMN89LYxeJConMIPnQYnMu1/oW6lKc0rlJvFI9sHwjt5fuUrG1iPvOf6mMKn77IuUpEumhL2JKG0LDkrHoLVq6ng3PvrfdR1oJ2IF1b+WEWkXh1PFFTOKfhX5TCdzSWHg2f4JRK+cfn2oKKh/ki5g+vx4k0eSDmwaEbHFsQgcc4SmRZfZ4Zhd3nx8OGj8WWosOtrfzs0arpVt+r64KOKms3gy7gpeHMrfBKsyJpgczkJ6jTkIv4nDiuvyG8kU5eINFfDTwE+YN1kI</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZ4U1jXLSDdXIUZ789fJPaQJ1j729qzhqogNjqjrBRv+OMD03/+Tzkbcq+4r6gK/l8xqr7iHvB1Q65aKWwTgW/p1WZCHbd4U4+ILlsLyHi0VIvNrrwPAZInN1ANrUnfEtVjExAyIQbbIFpH0nOfpRhDBkGp1lMDTj55UBZ2lDl7WsSq0WTvj4tZaTJNU7zC4dx4p0A196leqhfQEqe8zCiYRqGBrq8RcbdFuiSnQWy1vykz0KcLR/PAjFFn3iiED0tgq9R+ao3UXkr0KkzQDJd7D1Bx+ZRgx6jLdrJk26yhBqLZJKT6P2tIQ2+NaV6H0+9mDZaPd4/koPZya4ZsLhPexgiprNymDiOCF4j43ZntGrveY3mXelpirOeCJL4SYa7t/DvJ+rj+NB/d4k+Tt/x7BU7jRivr43i5hKYU3eDPFgEC5dhwrchPd39LWLW7HuIx6oCQdDBU2iffBnTQ279MQJbDvx3W/lOpsDaWEgeM4RLT50kxBcM8C1MrweQSzJDlY9sysugeTrFuwo85tCMeNUw3S/Yi383FfMGFW4wV25fLFA0hXXz3fhrT7TdY8o4GLXOoFHYyhM9tprmqfWNjx33bI6zt0uLiiF/0YUMA31+m91FgDwjAcTrnWZcsVDPY/t0r5SIkrs3r04qx9I1tP98KH6UUZfQTL/gMwQ3wEFWqjTz2lLy4jw/IVydwlLvhIdqLJG1bSWai8r7QeDNz5r5/FLC3t1YvhkpCv9WoScaL7Y6P+KatG/SuZxb/OmkqS/jYDbYVpCGIZCqshVFkwc4mWVaMWCx2wQCoZw3Qfd+zy+DGa8QmHlbc9RflyB2udwbZnSZ45xwus9T3tiSQQtsUdek6eg/xkAsBKZfApqOwyqm1/YEdaQWIw+DG8VrRVcXHXQAB0WCVfbprRsfiFBZP3XuCcEUc9BPAmbsCiW8i945EE0vHLNjc1HUslDPM/CY9uqeTfTH0q6u6XoDYjYieST9P2FbIn16YPV+e/zD7NEM5yvgvPYA6qwWY4XuO9bU7NwPtDPdf5GMPstBJHtJrn4RzYitomJHjQd+6xZBmWmWoL/3vjH33WI+09oZ4EGcGRyOKBwPUbmpGL9BkQXBmOZPG2dlPd7SVtMfIVGKYp9Czr0co4C7mlVDMKEerNWpRFkfLvGfBQcw/M9OhhiWZmnOa4QlSbN7rvRad4</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/oKUmX0302sbDhc8SCfv6qyS+57AZX9OCiqrO8xBUUDDla/S+iis315fb8H1wy3bNUsmpPt7PJrYyq6X4mptNX3DKas7BI64B2LRp1VJOARoAZuWnTSKjK6ZADNk39h7HTzNiwidGjIdhXsb2Qgt6PVLzN/Pj4zjcge+JV5MdQg</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>