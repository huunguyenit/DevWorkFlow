<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY Controller "S1ScrapDetail">
]>

<grid table="fs1$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SF1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cs1$000000" prime="fs1$" inquiry="is1$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Phế liệu" e="Scrap"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQowYlg7VPXIMNBmD+jseiZqj9uZprEUTlNGlIjk+qTjkA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILtAHmZGKx9ltCY+36N7uGCoJxYPNe8BzTlbCsUCtX4i/</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên phế liệu" e="Scrap Description"></header>
    </field>

    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQowYlg7VPXIMNBmD+jseiZqj9uZprEUTlNGlIjk+qTjkA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&z+Zxm2gaadWgJ7qSKmmTtRpUyjZvArDq5qaE9eL1UxUEp0MrMMXXbY6inLuRYm3e</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
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
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>
      <field name="so_luong"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5HvzbxBgumpis5MOcCHCpbCHUxyVuwPcSDjoCj4XoB1A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1wTIuS3c4MMVcs8FKGb8qqXV23YEt0552rcUoDfszkM3NU4bZYh7rHhcVBL+2Mc1ha9WtrEYUzSr3E87oP+lc7k=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS970XdZtmsUi61yoyHV3Lv1T+htwBXp1htSCDlkMJVweM=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdtZ+XTRwgYnMRjT6qJbjgis3/kbxyBqfrFdzI1YGWQtP4Hl2+cbKw5ptFZZ8MXUfdufzNnfH8TYFbvLTtfWXe1rEXJZaQMpC9xsobwAO8z4EI03edmogUrLouwThsqejsk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+3cjzkMHK2RjfNJH5Zu70dl1WjkXDX9JwP53S3UEmP+95ICJRFgjzuB+h1lxS8osPBQ6bx+9IBgBK4yxtS1N0hvdkfUQgZWTZ2xFdpdpn6Y</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqkkFAp+IAf1AoN1bjyVfATaXi+hfMFn8i8+B2+OaNDpJmNVKS/UFmTWgCCDO20xz7w==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2nH4PGNnXcwCg60QsHZDEAd2w1sN2vaQ4o93vaHBFRFHxd54KsTRMaFIslhIED+2UW</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILlMmXnpFUjBRC1KrBOCe9zYv4VaUena06Bbtn1OOpw+YACnk6mLfsCcPbxDvVD221bQYsqFauDVXyhTrq15VBU1ct1s5pTQxiYC4qiIiXbUelTM7YVsfU/Pm0XvEIur9mA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&z+Zxm2gaadWgJ7qSKmmTtccrK29Q9xO6AAlFSeYI/LPTtzYbCm3i19UrlzxexhHtgHrS3jJSqgbN1KFWv3b3a7qN4sFdvBlz7akjfbOhYqugO4MNdjNJ81Z4d4XkznPO</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9kzM1MFg7rupLYJM0kTa3w5bl/PWgJpeZvBVz7Aec5Mp76zBwQKRIUraPRqY1CIZN0vipc28T9gxZoIA4JA5BGLGZ+0gvX0Q9rK25TGvjPExmscHe3jxxbTSyJq/usfeX9sHcj23T+/bsFL5pqZVh/SmMJKUcLETvVwTcuRrHTKxLRbwdnX8fCfcBBFE+hsF7jgcHu/JPysHOFU89CKlEJMRMa8XabMZpYmEXNs1FpyI5</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLUALvksl3OTwW4uS/MvASGCpVGFcSOqD5S3C8v1UGCRcdTT1FrZQoJEB3nEz49rd18Pkmol8MqKkCxFdd3FVz8PPgQZJg2K5N13IkWXmOo6Duc7QLDxxL90ybq+hkSAK3eoqiw9/9OOnzIVIgSTtNhuhny4EnwOUn5y4cyYuDgSXBtPF5hzMit0OVGTwZnIkB8kJmkfOnVRVq4ytftMrLi2Qd5qdSs5GuE9k4zebdd57</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5Js58cXU0HfEEeEOxrgmkI+c0GTi3u3GcJUuYkTBz1odFHHyCWlI6E76AWpB3Qquhoiplt+9UiAdvJJHo6BtpQzw==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4R5WPurvONXlXPy/jxQyx5/tygPniSGVrG82pjVdXduiJK//ZfrB6eByq2D0qY0hOEQZq4i0Iu/MeeIoceyfWC3</Encrypted>]]>
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