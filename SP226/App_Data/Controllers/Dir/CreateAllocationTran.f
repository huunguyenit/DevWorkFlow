<?xml version="1.0" encoding="utf-8"?>

<dir table="dmpb" code="stt_rec" order="stt_rec" type="Voucher" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hệ số" e="Coefficient"></title>
  <partition table="dmpb" prime="dmpb" inquiry="" field="stt_rec" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" allowNulls="false" dataFormatString="##0" disabled="true">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_bt" allowNulls="false" disabled="true">
      <header v="Tên bút toán" e="Description"></header>
      <items style="Mask"/>
    </field>
    <field name="tk" allowNulls="false" disabled="true">
      <header v="Tài khoản phân bổ" e="Allocation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pb%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pb%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dmpb1" external="true" clientDefault="" rows="242" allowNulls="false" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CreateAllocationDetail" row="1">
        <item value="ForeignKey">
          <text v ="Decimal: stt_rec, stt_rec" e="Decimal: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="loai_pb" dataFormatString="1 ,2" clientDefault="1" align="right" disabled="true">
      <header v="Loại phân bổ" e="Allocation Type"></header>
      <footer v="1 - Từ tk có sang tk nợ, 2 - Từ tk nợ sang tk có" e="1 - Cr.Account to Dr.Account, 2 - Dr.Account to Cr.Account"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1" disabled="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="302" anchor="7">
      <item value="20, 100, 25, 5, 45, 25, 303, 25, 25, 35, 120, 25"/>
      <item value="10101: [stt].Label, [stt], [stt_rec]"/>
      <item value="101000000000: [ten_bt].Label, [ten_bt]"/>
      <item value="101010000000: [loai_pb].Label, [loai_pb], [loai_pb].Description"/>
      <item value="101000100000: [tk].Label, [tk], [ten_tk_pb%l]"/>

      <item value="1: [dmpb1]"/>

      <item value="101010000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="20, 100, 25, 5, 45, 25, 100, 25, 25, 35, 120, 25" anchor="5">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyCtlCatzm3RTb/rZw3+aUxk9GY2SpmD/wlWGacZkJIfYC/uK5KHPxoppxsj25mUw2kGnRh7ndL4PmVwXFqrI+8=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%7arGdHRG1UFKQn2XcRe2u6vOVmxj3vFLI9rkz+vbUj4=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%dUxtAbG76hDnHEpXdcWHx4BA1OiKJH3fm/FX1XpGA55EWUCsYrM6J0Yq/29P9VIFVB/pIoT803+BrLX8078P1XxoKEZfRGkJur2FtB0Eq4GWUlXkmc8Kj+ICau7qQ20WD2cKwCdq44IpVXOTxjYxYkdT2/3DxO2trYkeLJXwr84mEYaNdPB4gCn1EqdLxsfn7YV/8/+OzgfYv7aqQHZ+OP4mvYz/NvmGOErG6jUEGre/EXIrAKHaa46ilmIQkewgEI4eSBWGe66BJTxosUtKuTQPA3YKsei8dSqt0ztW+4WDO5qhoCCyYaY2nVpuqboveeh0A9r8P6Ojq+Qtc365YdfWQmqy8/Ls44JixC77KBPjryPhZd/N4AI8tCJlqNCMFjNgWxRw/bJgR792T0FEETu1wYvzF+WsxOGek7KXlcaZ4Vr4uWc0RFr2YqnwKe5bWxchH0BGH7yIavHJi31ldUkGEzm3g72YL/q86lOt4VZYSYSPtW7yAjHSTbeoUsh2jCp08TR0EQTRGtp3JvRyRQl+W0LNblsVquNDNNBbND/8I0rI1xa02uo/ijSZ/75w2Y8nDfZ6qnJBH3eWFxgZCeMCUNNs/06+hfPOJ/N2NnbN5uRZv4WqewrrYxXULp+yKQM1Op3hNfuiLxvWPrvOUnQHOQoaKGpTtyGodurB2T/Z+mcZ2ThvFJagKlAaZCLqHjXgq17Ib35yufqvytRjmXkRgNy85Qiu0sUZhae98B4gGTntaScyTN/oCiPSB+epg1jAS+sSkneWXKn+/ifIysMgTCByy5G/jMi7Fs5K2/E1301jQSJPWKjvwSl8PVNUYzrdkZYMKtbGvIpKVhD4aCSr58TVAD6/y09TeiOxTRcebmvuHl9Bp6vf9qobjAg6LBBF2Wrwi8DO13kxugtiXjZF095hZgLDniPSEWyA7ZAnBTygbIzBr7EzRoh+YOSi7KobOSai5Mw5o3KMFU07SsPR88t91QRq6GYVgsEvH8rQ02cBbt5SmZXYxAyl36rs7aezKIi/jT8i8qQjL/zbo7+turXobi+Al2wV+I3ntIg=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FgkIYxhqFyyFOyHOj7bb3FuFtbw0ghSGU+QJJMYFKAxrD8dkykJYoCh7Udh3cNbwygeusFSCsI9RRQDjm9QuEtVYvZZHFeqzt95181zPkjkNfsUrATm/voGiGSWK6w4emYIOgsIKEFZXcKZd4tccyGmEoZDwddSIVAfaM/bTRm9yVrDqGzg7DZg2rsTktvE9Ra9MrYRGiFQoSYkZ1XyqCYqSJgYkAQgclfsJkEbrcJ7aT44HwA5CcDYBlMOI8eGXkdMkThmXv5HSR5TycDvr0o=</encrypted>]]>
    </text>
  </script>
</dir>

