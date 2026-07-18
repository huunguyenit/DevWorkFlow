<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "CRWorkCenterLoadInquiry">
  <!ENTITY c1 "&lt;div id=&quot;&Identity;&quot; class=&quot;&Identity;&quot; align=&quot;center&quot; onclick=&quot;refresh$&Identity;Form(this);&quot;&gt;">
  <!ENTITY c2 "&lt;/div&gt;">

  <!ENTITY IndexChartTab "1">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Truy vấn nhu cầu công suất của trung tâm công việc" e="Work Center Load Inquiry"></title>
  <fields>
    <field name="ma_ccv" allowNulls="false">
      <header v="Mã trung tâm cv" e="Work Center"></header>
      <items style="AutoComplete" controller="CRWorkCenterList" reference="ten_ccv%l" key="status = '1'" check="1 = 1"/>
      <footer v="&c1;Làm tươi...&c2;" e="&c1;Refresh...&c2;"/>
    </field>
    <field name="ten_ccv%l">
      <header v="Tên trung tâm cv" e="Work Center Name"></header>
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

    <field name="Chart" external="true" allowContain="true" defaultValue="''"  rows="283" readOnly="true" hidden="true" filterSource="Plugin" categoryIndex="1">
      <header v="&lt;div id='ChartContainer' style='overflow:auto;' &gt; &lt;div id='canvasParent' style='height:100%' &gt;&lt;canvas id='ViewChartID'&gt;&lt;/canvas&gt; &lt;/div&gt; &lt;/div&gt;" e="&lt;div id='ChartContainer' style='overflow:auto;' &gt; &lt;div id='canvasParent' style='height:100%' &gt;&lt;canvas id='ViewChartID'&gt;&lt;/canvas&gt; &lt;/div&gt; &lt;/div&gt;"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="367" anchor="5" split="5">
      <item value="100, 100, 143, 94, 100, 8, 58, 50, 100"/>
      <item value="1110--101: [ma_ccv].Label, [ma_ccv], [ma_ccv].Description, [ngay].Label, [ngay]"/>
      <item value="11000-101: [ten_ccv%l].Label, [ten_ccv%l], [ma_ky].Label, [ten_ky%l]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2MVcG1OrxA1DDXQVz8VVTqCSZKeGkH8eEnTlvVUtGuhUd0zBfibcEKL8l7UO5kvT2c62h99yB00ADdo+f613gkkGUJLYFqz3XPqMMu1h3nE5Iv+GFcKf0PQ792XhSq9u7gPh+zASwATdNQZDssP+GV0h+LxVhduBmxenPY+w5v/rHxqg0v1y8NyPvSypezXcvYk5fQDVsxnGPpUfr9h0DcDGDDwMpCE9X8PPiRCi9Zzd35SF9BIj/w4detqO26YlZnhOlWHxBI4fwhO4Jic6wC3x0ED4fyuY1h1GqON/bZPVlbIHi7nCYNWvYb61ePa3n+ITNUDPTZtdhNzA4Bv3m83vRcG1YvR0rhcJ0+Ar9+p/uXlVO5tKAlpPX78Yy2tuTVZJtYJrzTLTpRjivC9gG9Jg9Ra7wZ5Dvxx4OU2aAXXae11wM3AfsWJAzW0ZfS8U30qgdVqwRZd0AcSHHaRSaTRQbEp3Fjrgf6RW5eoj8429UcskIagbRBoOcN/F1pa+rql7VnYy+ABBan+hRR6GJ3Mq8+OmWOEI93cirEdYjOhE2WvgLcqj9yhyn0VfbpSinyBJ4CFRiH69uj6kJ6Eg4g=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l19m6NCh2kYQ1r/v+9xlKqbzHIPOe6sBHy++V3KY6FI3M</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunE7Iv7MtfEBywozc2DGWGGZugB2B61zVw95M793HwbUR0Rti19V4bc+H9+DpbumqD//dSElL8LRpe7XoQDyXPSM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjdrHq/P9BPB6wVLtELblG8fPebyqlnmfrvCfW5MTfYtIAWokeLO1WXSBv0h5xxezEI8p8i3FMOzpEbNeO1wRk+t6TPF0PbHa63CWuiWQkIwShJNwQiG+E6/doCLTrEVS92g9lxE8pFHT88zAeVjUdcdvdoykK1dhXIfKsRZc/AgLHRylFIa4p6iCBGKAQtfFv8HOSuXHOMxpsVpDo/+4g1ioOl2fx86xCNIe/qDp3MRg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1xY9N7BlbBxD3TRpWEAhj7ao0Jd+6IBU7FzEc7QoGx4KBarfuHlEBxDRkwE4HovYj7rRLvt9/YMTm1OX693fgtJmL/1S08iM2dysnBbWEpRF</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2ns34w35hCMUP1T4TESY5DywMEr0dU+BRywsZjGDtycTbhDkpD8UoTeTDLoRVPLVH2n7hS18Czl7kle4xgG7S9AlkATVSg/XyR/kf7xICqEnTZlOozeUxz2Xv4dA670LdieOXhGPJUIl1Mno7Qh4yg5txFXpEdnSEVLNyr/Sm1tw1e3Pew28gFVIdWqWehBXvBDC/NGpZzxWntNc++TMyr9fjCVmeflr4T/Xudz4d2+qY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHaKWwx1w+WQg6f7c0Ou7rMu+VZwVM5aenHFkSuK7c9JFbbqZC71CJvh9UnSLZ3fV/LLenoXoCvktJpd4zrp2OPEOpnOxbIGlLBspwRqahxZldeuXjlIfyci7T7hHytuBOnb4hjUL+NuW/r8TAGAlO4Mcd1pFz06KQgYnKoDEp1AhuvuuoZOzLBQcvdid1nz6bj7uKbkAWGZvu71ZiNhAt6D1Z1KHadZI/QHdNT6V+vAMe+1xGRY2LAWLYaXpWyJdp6QkmDdKME6gpv6aji3CxSrANZBXdTqbwGFpVKg1NJ4vNYFfitNzqI+5GcojUtwVWQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&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</Encrypted>]]>
      &OutlineEntry;
    </text>
  </script>
  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzxgX4jLMXCAe9HW37raDZDq4CjBlYaRNRjZ7LuRuXFut+DbhiyTMmx3hRBkmZqxoX4G5fDP+JMvlHp6q/9BYLw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&/9XKFIvbF45gsd2A6RZniD84fbud+pC7+BCFD9fmDFWskuCSpA3z64+39feGH9y4GwBzEgjcZrW1JwHcXc4IQA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&z+NB3Ak5tR9dZDqIA7QrJZG1Obif5IPxe4HPy9drkZDPk+nI+5WLlqm8WhrvoE90IAhtcG7+Tk26Tx/ALFTXnRF7XBMPKK2/kx/nlWamEkI3Ybi98TWKYVH43D5Rq46TXy59XUL+5ComDvKyOJX8vxXn24CPfxuZ807OVseQUCE=</Encrypted>]]>
    </text>
  </css>
  <response>

    <action id="GetDataChart">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WmeHQPHTcvLogduoyEYNoI4ugjgwOmGll218+WJcKZs3jbE6U8lo7UAMpIIwHl5NdWbCXRfHFosnFAAw3M4TgLU86NaKejerG9EOz023Gyi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>