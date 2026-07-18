<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\RIGrid.ent">
  %UserDefinedFields;
  <!ENTITY % DetailTaxRITran SYSTEM "..\Include\XML\DetailTaxRITran.ent">
  %DetailTaxRITran;
]>

<grid table="cthdtt" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HD7" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cthdtt" prime="cthdtt" inquiry="ihdtt" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_vt" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="dien_giai" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="dien_giai" width="300" allowNulls="false">
      <header v="Tên hàng hóa, dịch vụ" e="Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="km_yn" type="Decimal" width="50" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="Khuyến mãi" e="Promotion"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tl_ck" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="50">
      <header v="Tỷ lệ chiết khấu (%)" e="Discount Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue" width="80" aliasName="a" allowNulls="true" >
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
      <handle key="[km_yn] != 1" field="km_yn"/>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" readOnly="true" type="Decimal" inactivate ="true" dataFormatString="#0.00" width="50" aliasName="a">
      <header v="Thuế suất" e="Tax Rate"></header>
      <handle key="[km_yn] != 1" field="km_yn"/>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
      <handle key="[km_yn] != 1" field="km_yn"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
      <handle key="[km_yn] != 1" field="km_yn"/>
    </field>
    <field name="ma_kh2" width="80" onDemand="true" aliasName="a">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <handle key="[km_yn] != 1" field="km_yn"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    &XMLUserDefinedFields;

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
      <field name="ma_vt"/>
      <field name="dien_giai"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="km_yn"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt2"/>
      <field name="tl_ck"/>
      <field name="ck_nt"/>

      <field name="ma_thue"/>
      <field name="thue_suat"/>
      <field name="thue_nt"/>
      <field name="ma_kh2"/>
      <field name="ten_kh%l"/>
      <field name="ten_thue%l"/>

      <field name="gia"/>
      <field name="tien2"/>
      <field name="ck"/>
      <field name="thue"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcId2xB+L9A0FuJAQVgRyH0gM/L5jLwqjOegq/ugev0ANP+pl12wcpq/b05VIXZBplJ6RKGQ/i10U6VIkxiyGbBSP8+c+XYPM64Cxku4oV04FWyhD4ufyzHGiT37R6lbJEA==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA2mKQxWB4EeqXEJfj7JkxE40yHbUp6SyuxNcVnzRutgsFn6hsU0iXcRrENmO7a6rTCE1tjDE0hTB1I6Lq4AlB7UhnaEqlH/ntPl0eZDHYaNP2bgzrBOmwPWcGnnc0BZP6FzKCJMuPnaTVOc+hMHCWUp4lLY8XwNuaeA3HtZp91wgmecndqrQPglg4MWPsU2Url6rUZ3W1plMbZkKzEGcMjk8CemQRTw6+v98VgeGaxW+2w4t7uJHkkoFx+iPjyi/7yRrb0W+8skKOBI+KcpAPU=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKV8SQqddMG9kdcvUjxHMu6bzSZGQTwdbvEgcxi+kcNHACK6ZzFtTXa9o2LCkFeYcXe+AlMUWjmyygqGA9Yq4w2o</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTaxRate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yFzgQLaNkA9HgJ1+G4ONpdXO3FyZK/yQ2lc6INQEgMBeTROAH9CHPFSbHqz9LbYybpA==</Encrypted>]]>
      </text>
    </action>

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXMjkR46jYNkuzrjgIVEw6TDt6NL/gjoHTsvvivRvMG5IsFJiyyBDIqOt8FaV7qsO+mU7Glz40iVenSczI4ZcGbFXt0XrO/yO0YegdbDOJtJO2W7e4E5Jbor7533akQaqx6xEfSmNmu0zBpQi4CNRszvuCFQsaQzWy/TXOiqXge+BK/ja9/PamwiVkRAedRu2S+AlhORJC5J97bkM3LfDcGc=</Encrypted>]]>
      </text>
    </action>
    <action id="UOM">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4BNbn3EphSGawguvqW+UToFfEkbXxKa8dSj4XyqxFe2udVN6Q/3/v3r7rwqI1KYnWofiXUjIIyggV4BzUSPWVb8xfNa4+7n2oij+BnzovNZy28M/VlXKMYkY6UzB2vUr4LKYFeCtLweeutgqw6ZNrI</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7503VQtgdAPiVP54YcFre5TyoB77Z2ioGAL4H71r0zn/C3EITUGI3Cs5vgypEAyiwa46HbU1kl7PcGDowz6b/TXkYVns8mSRYsK1NI+V44ID8lYSvQASTvb9dZS5fIskasvNdafW0c4ZkftiyuaH0mKc=</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGVisG5nLoGYmhhjfB8jxSt4lQ1jyaGTW1vdIlUaeEN9jpiUvAYEasYV/M/Wr4ECp5BOOg9MqURNZ2Y09m9eN+r5kHHkw6yX15+lbp9T9Z9f06uuj7P/qoxlvVVarlkG2oQfWNojFCym2rEV42YT3iBr+Fksi1W8AjoIVxnVkaLHRoGYXkpACRZMmHp8iPhA5iOAjI3UK2Xdqpk4EYXSDaQ08ZCE4sUZspvVLswPanvuD+mTSlsgrzfqY1rXSuRR/VWSDBcTvBMiPbVK5lqE3RW4tSAy3rHm6QM1m4X+dFr1cv+8uquTcmuOYqv/tKVBq2bPkgZs1fVhSdZEjyrbSdP/S+ngPyzfaMZdSoHZNtAxS9gpRZrpCh667QXcM46KbArV6OBqoR7TNPvD5nn8sqwevXS9k8XwwP6sIzYlX5c35zF8X8480qwFyHW0/pWQ3B2lUd6QaxWHDj8P2HGbRcS/t+EksZPGKf4F8p+qfs2WUg6Nh5Yk7NHf3kh1I2wgOYJ60fUxBmujxFJlhBLm40gGnUo6RSXxcJ3BwKUaQShhDXD8w1Oi1bEIOqArpvHEHVs4ZTYOdAG3deYXiB54JtqfxA0pcFnXLsNWcfcWtZ5K7K7azWtcL4iNKWTihmdE6uxFyv0908SBwFqJExW/Upi3yuwM5vnwFNvEKZqJv5yrTBrLZP6nQDrbyAXhw7f7zOauv1m/xbE4RXUaovmBCxX/EbtYcp6aKHiflG1XHweVayO2fB/187FZjKbSWuwZKL5ygW0zC9FYTA28STpaskYX2MSTBXObilXK8ype/HNPHspo/9VpD31YhmoKRYjK//DAu724ig8MNlwynGvH+WiD+mlY8YxIn6h0y/4wH0+87RF62DOUtVkz+K0nY+z4kcabFNOJwE828id20an3K0RJM4itACuWie8Vyvfzpn6d0vKB9m04/c4cDOSrJ+r9+UxjJqEhXq9RR+yU77EjuvVMbDmhWolQ7HgqJGqVP+Tibt85caFHffgL1govVFSAF0XMUX5qObZjZwx3gCdpMSGrR0/KFcXSq8ZLVR1jqQpLPKOg==</Encrypted>]]>&DetailTaxRITranRetrieve;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIWZMx7Kc2JPfhShJvnzwTtZk7AU4b3A+Fb8gl92JVUojrs7oOvXCyMLGEsH5ksjZyRHPEwYFrr/UgY1pzCP/mc8UlBF6gPu4P9pRTsu1dqPkvK5QvqzYD1ImqK/m/ZXC8BPHkmmTH7XlQT5Le2wtHFEgLdThfAzyVOS81tc8/eCSSzd5BLz6peCfg7MJqGzIgPZXmIvS1jSZ6zkxpppqUO0g2zGoNowLO4k41kNV9TAaToRR64GqmsLODJ+ZLt/VlK6AkLKvINacDomrXB/yE0wrNtlZ7r5EBmbcwR7tB5QmjlJ3NE5L6WiYiu8RGYMewrHvC6SoYRistvPfB5yODmCYx8KrfHmNu0+zC2IUHCTztj6iggU+BkdI9lH6AXr1pEgEefWJCfNYZFtP4qOF/uEgvUi0VYdyxI0Q5OT6KqxuUxJfEChWBv6BkB9blSDxuX4tZjHJonLymJNRP4NjDkWxvKEzAAcGOAw71NYFun4BPmy1KfS6WsYhkOw9POGl0fqszxPZbDkLjASZDljhu0=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwLkgQRQVeVPHXymANGcqoXdb8CO34oEp3FtKb6v6KL8Rh49k4jy6LgtliFr3KU1xKSNjvttiAT6kgV8DvJ2kqZ67YBmYsCyyJa6QhwVO3rdT+3ZbLNQrvggD3DtlLr4FQU1xbiqxwNurYH0PN+geyPb6Eiousw7NnKCZdkI7LXbrGvvK38bEgURcAd3IDH7Cv6bh7GK27lZGymhLwDVWTE=</Encrypted>]]>
    </text>
  </css>

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
    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Search">
      <title v="Chọn hóa đơn$Chọn..." e="Select Invoice$Select..."></title>
    </button>
    <button command="Cancel">
      <title v="Bỏ hóa đơn$$90" e="Remove Invoice$$120"></title>
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