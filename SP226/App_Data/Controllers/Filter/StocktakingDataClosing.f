<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir" id="PND">
  <title v="Khóa số liệu" e="Stocktaking Data Closing"></title>
  <fields>
    <field name="ngay_ks_kk" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left">
      <header v="Khóa số liệu đến ngày" e="Closing Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="11: [ngay_ks_kk].Label, [ngay_ks_kk]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZ0oyQejAKOjhPui1Zh6zxPk3Jid87ZhB1HTOC94NP31bE99S0MrCuw1Sa7r/Z3pVq9Gd7pfhf6+7d56JScrgT6z4pUYc+HcQ/r83mrB4TTYKB5WTPut9x+b/Fy0Hm2WAAdQiJkNdw/YylGvM0MION9goMjPP0RxvHLxRJHsixUvcMcn7NnjGoxSel4wyhqnqu2QjbOPL2XhCZCeioGIc1CfXQxZCnOXSqOV9NgO2iy5hoAS64wQ+jGM3PwpwCBneekpPuINNPV3hU9FhTxY0C6qXeD0w5pV4qeOLEZr6gGAi3pmungDXc4EpxDblSTNFY=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RS81+WTZpvg6mmwR7ihG+sDxhbgG5ymN7VKSRkti+BIBGgTcHAKbhvhAGcXu0ztbg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVY64w/6mZKJp2EmfUjtQddeuI36aQmcLcE32A6hjFwjL7A3T6zImRNacVTnrTBNOIt7OLufHv+hBYuXdT6CEsRTxETMgQz634CaxrGD4gUxaI=</encrypted>]]>
    </text>
  </script>

</dir>