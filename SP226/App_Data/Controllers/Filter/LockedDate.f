<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir" id="PND">
  <title v="Khóa số liệu" e="Data Closing"></title>
  <fields>
    <field name="ngay_ks" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left">
      <header v="Khóa số liệu đến ngày" e="Closing Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="11: [ngay_ks].Label, [ngay_ks]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZ0oyQejAKOjhPui1Zh6zxPk3Jid87ZhB1HTOC94NP31bE99S0MrCuw1Sa7r/Z3pVq9Gd7pfhf6+7d56JScrgT6z4pUYc+HcQ/r83mrB4TTYKB5WTPut9x+b/Fy0Hm2WAB9mjp4d/kXjIi8XAPJLhExQBMjUwLiZ2CeNu1NJ34c4iS+l2WUsptAgp9cPktELKwhmBT2kxVsQtIwsJZHW1P2SX2pe1Frimrrdk8HiMsm/sUD0M8sxE0SXp2cUtPPBsrgVc/9ZPcB46Yi4qX9Z2gUKY4Ye0duo8rvoZhiqSqZwA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RS81+WTZpvg6mmwR7ihG+vn6WKAQd7Z8SvgQzhHYtcd8MWgGtefRMlXg9CrPpBgXD8FDzMyV/drOiyEnJW9FVc3NdrZmYsAPTRpfR+W42YY</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVY64w/6mZKJp2EmfUjtQddelFvoTXXgykR866QnQSCQ9AKIk4EfYYxkZeU5BadjsnTtlhcaryEOoCngP8rQkccDRItA6ttB6Ak/vTKzYPRvZo=</encrypted>]]>
    </text>
  </script>

</dir>