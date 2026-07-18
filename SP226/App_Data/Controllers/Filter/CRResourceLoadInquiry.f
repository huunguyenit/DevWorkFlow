<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "CRResourceLoadInquiry">
  <!ENTITY c1 "&lt;div id=&quot;&Identity;&quot; class=&quot;&Identity;&quot; align=&quot;center&quot; onclick=&quot;refresh$&Identity;Form(this);&quot;&gt;">
  <!ENTITY c2 "&lt;/div&gt;">

  <!ENTITY IndexChartTab "1">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Truy vấn nhu cầu công suất của nguồn lực" e="Resource Load Inquiry"></title>
  <fields>
    <field name="ma_nl" allowNulls="false">
      <header v="Mã nguồn lực" e="Resource ID"></header>
      <items style="AutoComplete" controller="CRCriticalResourceList" reference="ten_nl%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99H4+HD1f8HHvtmcp5n0yO1nnV9ARJg0XgEoos70MBr4L</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUTb1bX/MifJNrb+5wfHjLmtb1aI+cjDzRGSmQobeUFg</Encrypted>]]></clientScript>
      <footer v="&c1;Làm tươi...&c2;" e="&c1;Refresh...&c2;"/>
    </field>
    <field name="ten_nl%l">
      <header v="Tên nguồn lực" e="Resource Name"></header>
    </field>
    <field name="dvt" allowNulls="false">
      <header v="Đvt" e="UOM"/>
      <items style="AutoComplete" controller="CRUnitCapacity" reference="ten_dvt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_ky" readOnly ="true">
      <header v="Kỳ" e="Time Bucket"></header>
    </field>
    <field name="ten_ky%l" external="true">
      <header v="" e=""></header>
    </field>

    <field name="Chart" external="true" allowContain="true" defaultValue="''" readOnly="true" hidden="true" filterSource="Plugin" categoryIndex="1">
      <header v="&lt;div id='ChartContainer' style='overflow:auto;' &gt; &lt;div id='canvasParent' style='height:100%' &gt;&lt;canvas id='ViewChartID'&gt;&lt;/canvas&gt; &lt;/div&gt; &lt;/div&gt;" e="&lt;div id='ChartContainer' style='overflow:auto;' &gt; &lt;div id='canvasParent' style='height:100%' &gt;&lt;canvas id='ViewChartID'&gt;&lt;/canvas&gt; &lt;/div&gt; &lt;/div&gt;"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="367" anchor="5" split="5">
      <item value="100, 100, 143, 94, 100, 8, 58, 50, 100"/>
      <item value="1110--101: [ma_nl].Label, [ma_nl], [ma_nl].Description, [ngay].Label, [ngay]"/>
      <item value="11000-101: [ten_nl%l].Label, [ten_nl%l], [ma_ky].Label, [ten_ky%l]"/>
      <item value="1110: [dvt].Label, [dvt], [ten_dvt%l]"/>

      <item value="1: [Chart].Label"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNSKJPlSnGN9/aYKLcBiqn6WuICZCwAgZqVRG5fIk5pVjGS/gAYFnPDFa6Qv1QY2PJu+Gm76bqqMc8daNhheBRU=</Encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2MVcG1OrxA1DDXQVz8VVTqCSZKeGkH8eEnTlvVUtGuhUd0zBfibcEKL8l7UO5kvT2c62h99yB00ADdo+f613gnBo0axJ2rXW9tvD+pkUIOvq2FMIswUHXTREClFUiS5eyoONkec3gaI0DmOhlM/9WHH6LkWCbCJlH+XCpjKcVJL5++gR+IbboymC/dvXiORySC/QX/hTaOOx2+pHpVZq09Mn/AEWPLvifd5Wf5mYkoFPFaNBQ72VEUC+AC3K45P0OA8rgAkdr3LwwlMv6XlT6djIW4mPC51PE1VOC8v72VmYIH5IucZHo/UgTMNEwGI7l7gDWzvZTMlXWF8QWBGatah/TSuGzADzes89VzU8IIyrd6jPKqDDPdZQ7bFA1QNKJQW5wBtS45mYb1HbXwpMZB2KdkLmH9VVHHliign4kun1g9TmUI7GEHirX7EENqWZ/iWlKMjgxDOA7lwVl3o7Sqgu28Z0WQtOQkA1w2yohHpw/1HcpL/P0xjFmXtIbC0mQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l19m6NCh2kYQ1r/v+9xlKqbzHIPOe6sBHy++V3KY6FI3M</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunE7Iv7MtfEBywozc2DGWGGZugB2B61zVw95M793HwbUR0Rti19V4bc+H9+DpbumqD//dSElL8LRpe7XoQDyXPSM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjUgX3lURZqsaWV6GDk+J6qtu6u0KBLjVR4TdwxIptEzEsucstjKef4RvsRfaMDJIiagJz8vk8RS4Q5tJP6ht7qoktWCA8PSIZLQwhyZBedUh7HqvRDNxnBC3GLVjHKGffTxMuPG8IBPV7xVkuQX70tRI1ynjqzuXSe38VO9XmewQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1xY9N7BlbBxD3TRpWEAhj7ao0Jd+6IBU7FzEc7QoGx4KBarfuHlEBxDRkwE4HovYj7rRLvt9/YMTm1OX693fgtJmL/1S08iM2dysnBbWEpRF</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2ns34w35hCMUP1T4TESY5DywMEr0dU+BRywsZjGDtycTbhDkpD8UoTeTDLoRVPLVH2n7hS18Czl7kle4xgG7S9AlkATVSg/XyR/kf7xICqEnTZlOozeUxz2Xv4dA670LdieOXhGPJUIl1Mno7Qh4yg5txFXpEdnSEVLNyr/Sm1tw1e3Pew28gFVIdWqWehBXvBDC/NGpZzxWntNc++TMyr9fjCVmeflr4T/Xudz4d2+qY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHaKWwx1w+WQg6f7c0Ou7rMu+VZwVM5aenHFkSuK7c9JFbbqZC71CJvh9UnSLZ3fV/LLenoXoCvktJpd4zrp2OPEOpnOxbIGlLBspwRqahxZldeuXjlIfyci7T7hHytuBOnb4hjUL+NuW/r8TAGAlO4Mcd1pFz06KQgYnKoDEp1AhuvuuoZOzLBQcvdid1nz6bj7uKbkAWGZvu71ZiNhAt6D1Z1KHadZI/QHdNT6V+vAMe+1xGRY2LAWLYaXpWyJdp6QkmDdKME6gpv6aji3CxSr5S7McKou42FRXgNeU1vx9n13q7e77PCuUdQrchSVcuZlUT0a6hbKINj7KlfQRLtQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHciz7mwfeXU2EOZF7hjzrW4DK7Y3+O7sdr/QlXnwIg0ISV/rm+i4fTXL4M75Ui7JBjqO41XOHG3AbeBS7XuXyWD8cjrMzdpEcwIZGMdVss+qZ4nkyQ19cjYEJA2AkHcZJA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&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</Encrypted>]]>
      &OutlineEntry;
    </text>
  </script>
  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzxgX4jLMXCAe9HW37raDZDq4CjBlYaRNRjZ7LuRuXFut+DbhiyTMmx3hRBkmZqxoX4G5fDP+JMvlHp6q/9BYLw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&/9XKFIvbF45gsd2A6RZniD84fbud+pC7+BCFD9fmDFWskuCSpA3z64+39feGH9y4GwBzEgjcZrW1JwHcXc4IQA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&z+NB3Ak5tR9dZDqIA7QrJZG1Obif5IPxe4HPy9drkZDPk+nI+5WLlqm8WhrvoE90IAhtcG7+Tk26Tx/ALFTXnRF7XBMPKK2/kx/nlWamEkI3Ybi98TWKYVH43D5Rq46TXy59XUL+5ComDvKyOJX8vxXn24CPfxuZ807OVseQUCE=</Encrypted>]]>
    </text>
  </css>
  <response>
    <action id="Resource">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6iALfyNy6McP/xwtoaa/aGcydHb4jkS/l+MyVCfSFIqt3+0s82a/Fd4GXtMZR+xv0M+Y+utaz+prIWrhT63QS6WrLMcy/8CKY4zWo1i6HzQ3lzOP8LWpkKesYDwfWY8x5y61hGfGDwymJtJR8GHHsvlCch5mT7rCvofT+EAB8szg==</Encrypted>]]>
      </text>
    </action>

    <action id="GetDataChart">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XVyd9piWcNDkKK2C4+8aaXp+5B8bpXARBHh86U/HuRDAeKh+KDJmk9IMHM4FZd0ZLkHOMvlWkMyw2bc/P/j7kAxA73HzHDvRzIR9gm6LKlY</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>