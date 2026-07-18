<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  
  <!ENTITY Struct "FastBusiness.Encryption.Begin$3H7kPWBUT0Qgbr/0jUL75+w6qV7TgQPdmCKvJcvvEAVIrB5wuzF75Bdtvfkr8IK3l9kPDvb6F+benxhNFoOt0P57FPWaaxZfjcM46fKchYfmZBEAqkaIhPx0NornjOLCge0Jcfk4QgjDM4JeGmI9wXkmtlDCGcI/66QHnkzRgqM=FastBusiness.Encryption.End">
  <!ENTITY d "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+xq9+O5syqpdd8o5Xcasw+eRboO/7yVHCqd3WOhJL5PF5LRq23FWHsrqWnFsUYOl0xSSAsHiAOM+wgZi1Vkbmsa3ExwJ6L6eJxaIw8mPiSPj6jv2QirNpdP25P4gQBvo8G5KiDpv2yOoKPsqAHPrMxd4cEilM3JTkbNh3uHo4pJYvxSwqzk9TTUAPf7zov1W0UEgzTK2yTsnpflXiNK6ViQ2XPSRJLYTy9y34NAVndU7cTTP+ANqQC06ctLJi6XlBQ==FastBusiness.Encryption.End">
  <!ENTITY q "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcHgE6Kl9x1JBrBGDiu4aGvaxZ5Z2nvcgbRyxcoqk0rnpZNKQoueaXAIqe1h+PiOUABX0nwiZC9e/nnIlNZthr8XRuSCaktO7kyFJWLTm3o4KJqH9SqdrelKiKL9SA4K+5WfNEMliU+J5EnKrocDJExI3uGwj/6bWZB0EwF3/0ME9JkaqS/tFLVAIQHAz6iNVu2Qk4/mAJfp9EuBbcKWaMn/JJAM7UtAsQ3gu0fah9XIeiW4+h0kDB62CYPoo3eR2cOuBI9mNwhJg+BhOXpdrNvlrNFONfwMh8/FhS/3uVmViHiP0CoM82uaCD/4o2oamlg==FastBusiness.Encryption.End">
  
]>

<grid table="cthddc" code="stt_rec, stt_rec0" order="line_nbr" type="Detail" freezeColumns="2" id="HD5" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cthddc" prime="cthddc" inquiry="ihddc" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="dien_giai" width="300" clientDefault="Default" allowNulls="false" readOnly="true">
      <header v="Tên hàng hóa, dịch vụ" e="Description"></header>
    </field>
    <field name="dvt" width="50" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nt" width="50" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
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
      <field name="dien_giai"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt2"/>

      <field name="ma_nt"/>
      <field name="gia"/>
      <field name="tien2"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLio6S42idr0f5LevM4MJn4gsABSWVWM//z+JHW3oH2i6XaG/emY53fSl7kZvLPWpi++Q+85mVZjZAjWYN+7S5U=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7550RJYl9QjQASlipz6VsO7TT0miztFa/EpQqIALvQNCTfGWcuJFKp6/2sTAr1531PQSd6jcVXD1sCF9qfsKfP90=</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753HqxdU64tYQD6ezw5YAHxyp9MPy2wJP0w8LBGweF3MKpHP+e709WcEA3mjEoQ4I8lDzfn64u5WhqOnoEqOSYaA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtersii3vgtujo0hiUhGzQZW/0VUQUYJfcJR1+8XjOQ+IWViYh1U9k43A6+r8YK1B/0fRN3aDrkEQ2rgOqqaE9D7MwBqORDRkoJkvcH7oI7zGLr7c9I/2lteXZOBYpwJ8edcUOiBdiNcxuCFs63l35Cf6nHVSxsjxZOPjB5vALn89RNeEyiSKAn+1YIDpCQsNL3V1ecE5n7dmvyZWhCbRlhBFZEoxXzc+OLgAvvGehSAec4PhJkLevOVzyS+zwC7L1DqO8plg3GRBrQ1E+oq2Pn9p/YCATpvlZHYqaxEmgg5wXMaRHhIbSgDtgLQ0OqcjWoHCykYb1qZ2XdJ5GXUh2/19vDGma7RV2DO1SNTSwPULjfX+ulsCBg6ZbSRhVIWCrYAmcD7CSS2A8Vm52W5xwrrOUTkhkAvleosnfK2lf4e7V6PHTZa7769uQpeouQJkoUn44JBMho25t81yU8AXQwZhm9aSeBsbMQd9o6ZgZWGvKzSRmcOTPLy7uqQ5C9ZPqCkWfd0r+KP/0wdTuqvkQGYtqkP1iZrbX+CpNMNYcNHFCb9K47vS0lhCpQZadObTd1kPRIJ1af0iyM1oTVKtNVYGDR38q8p+txZmcpnD2kpNUUg6AC5t6TrgemlwDtCPYfgfwTv0ggiHQ/Oz0IJjTRTIBX9fDznPrhymAbOEJ9THK6KugL8eEPXzydc4JylStEn8W+DjzbVBf9ZN1ddnKpCQklhE0XhgxMC8JSux+EvWJSY7mz+lNRRrg2PUGLr0mzZNOIBmc1r6piNUWV497ux/s0cN0QgBrEEcCKYZLHvLS9ZJNGhP37Jfq+VL3WOhf1pOhN7u/p2/wFT1UaQBPxbN/wTkSJi543P1rVXihawg5LBI/PJrdg/2o7DPdhzbfZO+UJoNTds0/Km0mnD/SLw=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3HBzvsr2SxrCuZv5fPu3qpz+E0KLf6iS6A4XRyu9j+D8IRC3Lhsjdgxk6sMzsaV4onIExSLUpgUC4XH75t9D+CRCDtGYg4snT64raSDCan1AbMp9aJtyYWOahpLTNcLtw==</Encrypted>]]>
        &Struct;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ110+3RBftiA2EGWiFqYBgObm+8yn+HpmaPzysk8QnT7b6cwCxel3ISLK0NeGr3tJrVhTgYDIu9+Nka8TEAfcM=</Encrypted>]]>
        &d;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Uifo75Gk5ofLs1IbyzAkuvcyussJx0wO2T3DEwyQoZX6xSMutf0GaXAWoxWb4DjCaETpqMH7Cre8PLYPVOd2GS/z/sjBKaxwNTpyFS/dlWwhg/iyCYLv4xwse+2PEK2tBDSVHZyoJ1FTfdIM6fkf3Z6P32q/IqN00hlR22v+/86C1E4TJOXt8LG2wQuD51Qf8aMrd9AAVZnDuGaKxUJCjGbgpmZz1tOUUFvfmWYSoQF0MBOANpLQgOhvwwLHCl0aL9taoJ1OJ+VKNUhHQb043cvzB9PCH6GQ3/3pzSLb2HnpMiX4ctN6w4oQhViT9DQWNVa7fBUHCXJ5vu4Y8TWzp9irf91dBMwJZZxgU/zNdZvwb7tldLq5OhZBV40gtZkh2SM5V6psl+IW3wUR/+uVNaHEbFgBwRgzfIuH4xIlb/w83F3wM97Glh+1iRKDNBk93UwFSZdQNLAra2ODQXPXWyUQpn+tb9Nny54aI8MpasQLLeDXGcpLMIaPenE2F2VwDj6CFMOK4ABEtkWxdfq5OrJamlpuYCIHLq57NGexGuruxYxlK5I9zwpWi/LuQgEjA==</Encrypted>]]>&q;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4URzmi28+MOrJxxuhEzUnGquOQBoN/IF3Z6UUuBl41vgueDAF0pCF4nvJii+Mf8kv29kHxNFnN4OQ5+HaLbmfD0=</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        &d;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMTOxmA5nSKTlEJOyxuSgUXQPMIwFqImmUpi6jggZnrly4Cu/am6eu+NmqJK0NHZQwPJbF4XG/dhGGtRyJXyMv34QDMtkQ/rs64VkJ7kma1clCEA6lLa0rU0VC+tDiq7qiEEZSfjnXGIJmaI066IcehrUUh1mQwLiAjX1U5kWM1V17kZ85mpljBB2zioarkxH1TerDPbyKzZ+2MUqPnhcEIcD02tqqyQCjwylyikA8IyNRn7HwTFIr7ao9FPfIYE3vSgqa3P4ZBkiCf8qCBTHCFYnhqppmY6IyecLZxRNQhuVr1n72IqxeMhI/yUxh48zTTb4LMkSEh4dl0zBILrJAA=</Encrypted>]]>
        &Struct;
        &q;
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwLkgQRQVeVPHXymANGcqoXdb8CO34oEp3FtKb6v6KL8Rh49k4jy6LgtliFr3KU1xKSNjvttiAT6kgV8DvJ2kqZ67YBmYsCyyJa6QhwVO3rdT+3ZbLNQrvggD3DtlLr4FQU1xbiqxwNurYH0PN+geyPb6Eiousw7NnKCZdkI7LXbrGvvK38bEgURcAd3IDH7Cv6bh7GK27lZGymhLwDVWTE=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Chọn hóa đơn$Chọn..." e="Select Invoice$Select..."></title>
    </button>
    <button command="Cancel">
      <title v="Bỏ hóa đơn$$90" e="Remove Invoice$$120"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>