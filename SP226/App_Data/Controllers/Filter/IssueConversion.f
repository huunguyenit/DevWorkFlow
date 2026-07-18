<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY f "ma_ct in ('PXA', 'PXB')">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"></header>
    </field>
    <field name="so_hd1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_hd2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_ct" allowNulls="false" aliasName="defaultEIInventory">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="&f; and status = '1'" check="&f;"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_nt">
      <header v="Ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101-1: [so_hd1].Description, [so_hd1], [so_hd2], [maxLength]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRdq+JMvaYUwdjDYqWqhq0i/SPt8iq4cjBCs82CN0KemucqO7+rpIBpKJ0Mrf+IqOu27cUqAU3jyZjQ1G3irTI7yznBbz/RAuEeMdPdE7icEjWgEqXSQWp0MSyVS5Jc4ffXCbKyhpQOb1/50q3lKAqDHiSTA9EZm1/F2evVLxtFc/lho58qPxK1E3Hb5IHRDUKQ1WJVlc/W9gcV8zcScBb7KsYv+IhfcwzouQ3kYR2BfK/r3TIjvaX2LSlZ2DTu54sAg7ognereX7vpsPE7hArP93BcIwhS5rnw5EyX3Whf</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1knDQUw0B7bvwvaApV6TauN5rEPiGSIzhxTReNJ6Gc8vES9fT/jObX0w/QWzbP4aQ73nAooObm5VbXyTfBspL0=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KoczGETFLZoy5LmJbAT+UqcZs8njiQIaSTAifVSPJFSE2jsUHv++J+hfidNTc84JdsWagURkmGyDmOZcA4TndBn6ZbogAon1FC+hzbbnHduUgFLYhD45F2cb+njBBs9NzMyiwniC6aVaOOE9p0t3smI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm483dLYLoMNHd2GlBBCYXZZ7FyLwr7k7cibtaU8YOtzC0AO5Qzkge27HRDSv7KT528k5Xq89paksNPndtEUm4Ospf4p1MM4Y3GNS9Dm+DEXRzvm0YBXTo/m3ii7pW3KRHOBl3PSfWfCj5L5Dez33Q7mXeP/1a5nAXGNujpOKltzZwwWK3XdFLkyJ0V71lcP75mqRYPTMlQZ2wsjkq3xNfbdIQEYF/baZ3Lpf/hube7YLHVri4Ch9+/nP+3So00cJ/Bg4+DwSEYjROswg2tAICom9CTp5NsRve4+gvF+mTSO1pll8ovfzsGnZEn0j4PbPSP7ejxhK+Knqy0qa2fZ0iqhCNGiXdHJAK/JEJsd9sff2Jn7gHhihXDuGKxsm+g3qdF6FeEiiOt2o8bCt/gTXcdR3ik8s/h4x1GM/dBEJARzt3/kFZ/j3VZu7BoXNSfBT2v37i25WaxyxS2K/EtegQhtDjK3rjxxQy76vlx/pcRfSh584GMQ7GMqmEfECdeBjbmCWXn5d/2JtHj9nTDqhASOTfgP5a4hfcFFeuxtwfApwS3RKyZ5h9Y1SWjcIR3EtzB+ONXXJF3JLdIEcPy4SQer5YOl/9vlqMbpuVT9v5xMmfShgDs+Ld0FmcTp9ee+TdSKn0dGhpbK0QKgcFr+00IC5FaQj3GU+kvJilXlKV9UykRbBkJNptV2GtLd61KDHoNgxhwI5gH0PPzQRaxc38QxrPddmSYUFVym/VUAQg2UP7zy/KVxeCVMD5j8CsfqqPaOidQugydBpI9d5FSNNkiDcoN3wAgtK90asEXThr6bewEUqfYVsEwWV2sBDSbFLu2uVmg9vBJR2nr7ZsuUWU+2lxaIC+ZRl/s2iFXdxeE1VmnD2/nVu9wgGmIDGFuq6vC8=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6V9+gjo1rINIXNWaM/sqixhxNRanNlSrJbcqEUumPZ5NnjXjNfGh/+irACFdRqRC6eiNaDMeoE11k6iPH/6pkWgBewosJi5g8dg0mHap7ZGGStufhagxdp0oc7E74ObltUZJsiCsAgNGnULY5wkAp/Y=</encrypted>]]>
      </text>
    </action>
  </response>

</dir>