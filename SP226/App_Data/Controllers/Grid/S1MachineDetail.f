<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Controller "S1MachineDetail">
]>

<grid table="gs1$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SF1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cs1$000000" prime="gs1$" inquiry="is1$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_may" allowNulls="false" width="100" aliasName="a">
      <header v="Mã máy" e="Machine Code"></header>
      <items style="AutoComplete" controller="SFCMachineList" reference="ten_may%l" key="status = '1'" check="1 = 1" information="ma_may$sfdmmay.ten_may%l"/>
    </field>
    <field name="ten_may%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên máy" e="Machine Name"></header>
    </field>

    <field name="gio_bd" dataFormatString="HH:ss" align="right" allowNulls="false" width="100">
      <header v="Bắt đầu" e="Start"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQowYlg7VPXIMNBmD+jseiZqj9uZprEUTlNGlIjk+qTjkA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&K4SVxY+qpJSwiZ1vaCyJ33jVV/uVL+UofJU6fx4n/ENImcOmKWukqWNFOx6DmAFy</Encrypted>]]></clientScript>
    </field>
    <field name="gio_kt" dataFormatString="HH:ss" align="right" allowNulls="false" width="100">
      <header v="Kết thúc" e="End"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQowYlg7VPXIMNBmD+jseiZqj9uZprEUTlNGlIjk+qTjkA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&K4SVxY+qpJSwiZ1vaCyJ33jVV/uVL+UofJU6fx4n/ENImcOmKWukqWNFOx6DmAFy</Encrypted>]]></clientScript>
    </field>

    <field name="so_gio" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="60">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"/>
    </field>

    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_may"/>
      <field name="ten_may%l"/>
      <field name="gio_bd"/>
      <field name="gio_kt"/>
      <field name="so_gio"/>

      <field name="ghi_chu"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcId2xB+L9A0FuJAQVgRyH0gM/L5jLwqjOegq/ugev0ANaL9tqpAPeRYfE9jXUruX/7utwALBVEinugCYDSdkRxc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKVhW9Ye2P9vN6XVGbzXjdRMpgtQkSCcygI0pfMbNNFx9g==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5HvzbxBgumpis5MOcCHCpbCHUxyVuwPcSDjoCj4XoB1A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+IxxnpAUh+rK5O3sFPyOzvcDsGrLgSLcml2DLgzJkyaL3kUuTtiEu/yxGVDZQ7onA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETrgg2cJAUUEvqFMrqnln75mCWU6VHA5gaVmr0U6cobItmNrn6xb+85WUieD2RwGhaVR1vfwyhjWZ3R/mq2X+/o=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l19JI98VNGAW8ycs4MrU8JzpG68cRzaZG7H8DVH5SR9/Pk85PhsW6b/rW9KKYMh97IknVd2/g6giNsGQ1C+Thov0=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPY4SNZoMxfKYYSfTxVuOOtZN4w/rAk0Ru/ZNzB5XNOWVMz0nTrDRvQ41t2iWTOqAtQHG6Yr8FCD283mauKLSVa</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&K4SVxY+qpJSwiZ1vaCyJ3z5ZAUH7sNqJJLdgbKBJgjwF08iux7j3RaIhH+gtNW3PFwVz+B+KncYVOqsOCL8hgAFheKq6EBbUJ1yOAJQw3h4HdirTbYwtq1+NsuJXa77yNq7dT2jRe/N8FPYGHpdHGKFDD0v4QKZwg+KjlwH2m69jXJBy5GsMXgTScs6CaJfa2WX/SjrujewfHA5aQQ1yFBUKZ5KILecabcYhVd44PybIP6sdtlzTgKdKIYeSFXJ8Yk1KW2+W/eMgjI5DRiunykFTHpWHIK+yuesBXb7/U6GSJ4hO8fJ7Xt21HBpyAwmYZB5nmyYjsGms+nWPL5NrJw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9kzM1MFg7rupLYJM0kTa3w5YBVtQWr+ago6kkBPRW8TwSa3LI1ieIU2PUw1Wqpw8T37pe5c0M+C2hd0X42SRqZUnf+QzQsLfAGqTuChEE5i6XiiHx5COk0nSekxqVhHoM0DvJ46btQZ7ybqCf/9M1WFzreQDj1WBZ8rz7/4uliGL3B/iGQgrgoow98uIspmr64Lmm7yy48pbaCvmUPYO+jpTWmwffvzZPfQ+IO+5DkXmpLgNVTOfDBy6DZzIRxlMm7etmGd+d7Ek76NvArjoCRq4=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSGunKU5pVcB59TPrPt1Gx0dZgdoUzxGkb0mGeKstd0cf5sxBZovqqz9NERdp3j2oqCb2gIznfuHEKrcLo//mL6TMPc+pEXrCQaxAzaIzVEri</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>