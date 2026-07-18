<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="vdmtbnsd" code="ma_quyen, user_id" order="ma_quyen, user_id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>

  <fields>
    <field name="ma_quyen" onDemand="true">
      <header v="Quyền sử dụng" e="Access Right"></header>
      <items style="AutoComplete" controller="NotifyAccessList" reference="ten_quyen%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_quyen%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="name" onDemand="true">
      <header v="Nhóm" e="Group"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="user_yn = 0 and status = '1'" check="user_yn = 0"/>
    </field>
    <field name="comment%l" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_quyen].Label, [ma_quyen], [ten_quyen%l]"/>
      <item value="1110: [name].Label, [name], [comment%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIXJw+y6RDyH7TGtu639WBRFj2k3BLkgxknlQ50/RiCyosyRbMooqee13u4yqRdN318AFNAoyAMc8KVicXDFQURsTEH+DUpFt3ruV6orLb2H</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHmttEt3N+Un1w4Vt8hY+oQIjDw+yzcCGUxleA7BqcgpADzG/kNbCtgB4DL+yvpBRLSIbdbp9W+HfMcrwYzEXc2BJcgk3EAixgrUu5TQmGtu</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnfujKPrfuTOBE8OZlqaWBO6f7+9Vkm8iohapYQkzfsVAqV+tLhZ/k1QCuqVkklT+MTU2Y5qHofMwC8F+Q+7YvvODpMguPPaBTe75j8B2CrFz+83U7R4XbcnnX/4W4nHN+IdfcRdZ2j8cXSNQPFOITvrWbgRYSOxyMuowUTLxUm1VAb91A5WGt6kanEfXVKuYKOz0MWpD9kH2W0J0tH+NFh</Encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdCZ0og3+rn/xGOd9dNjdtdVMDwcpd9fb9/z/t3R2vQWjMJ+MOaFpt5jif3EL8pTkoN3gK/1sehffbcOqn/yfZfdOdRa6Js0sH5IaYYZF38BnBdwF6Ir2tirVNvEtPCHjE3zCLegvchhFV34yfZBWf5Gkn1TJvsuw1sOhaga1uIPl9f5czFfVI3O5ugqbqade3jfR4pgYKtYPVOeH6qV5BQn67chyBffq1h+3o2xcMGme1KtWHGLzk5QK8E/FUh+A1OTj1cNgPj1RQxHfQphyyHAstx+JeOiV118DPwidubZu7RmGk2h5U0+XM5PsB+wmJoGXn5co8mQjdxv9gnj/LQNONqS5n0s6vbEBm6roj4JRwzSAcPyj2IA9gyypcBgL11f11VZiGMg+Gp/yz/wvyhihdreu9UEcAOv8UoY2iIHPliaOd5BS8+YrXMXq54p7EEveXtIL9HWnUJpmoQvYEtSbwMRlBZ5OgJfdH3UZ9LppV5p+swlt187B66MGaUtdqIKRiD6yPQiRtocE6l6JuSX+mWHE0KPjv97ybqr+LLVj5eUa0GnOeosmwHUnqln1sg0BorC9gIVatRj+ZQYef5ohJOyh4C97aL55025yt6Uqchy6G/0GKTvGABRZ0z0Q3gsq9gzU9Yoqm1VOirImtbX+ovu19SgPD1LzPs7vyZ7TN1GvjMowFqUkv9OnkS9sQ==</Encrypted>]]>
    </text>
  </script>

</dir>