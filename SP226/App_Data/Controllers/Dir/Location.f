<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmvitri" code="ma_kho, ma_vi_tri" order="ma_kho, ma_vi_tri" xmlns="urn:schemas-fast-com:data-dir">
  <title v="vị trí kho hàng" e="Location"></title>
  <fields>
    <field name="ma_kho" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã vị trí" e="Location"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_vi_tri" allowNulls="false">
      <header v="Tên vị trí" e="Description"></header>
    </field>
    <field name="ten_vi_tri2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110: [ma_vi_tri].Label, [ma_vi_tri]"/>
      <item value="1100: [ten_vi_tri].Label, [ten_vi_tri]"/>
      <item value="1100: [ten_vi_tri2].Label, [ten_vi_tri2]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwc1hr2QSu/g7w1/jMY37QYNW/oW8aI7VhKkIz9ajyOeAyxid7PJWTKD1JUK6yD16I0=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYbymF3CigBEm9z+Y6CTZsXgjnel0bvHGFLqLZchA7t+K/XA6d7xzRl2nRNx3cfsPDE=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1W2aVy5CNZEtxKQVNmZh+/qcK7c/d2V6ROoe/zyNDhEkDiA9Ia4BQai4DCbrlUaE0PyHYlLQ8ZqA2z1599FqXL7RS0NRGd9Jm6jEQIyRdpe0Iak1qxTNTiUpM22NkDyE00PXOPYsf8CI9YGmECZr3sYLlb67pNSfCu4u4B+j8U7EM7BRiBaxBzgYAszEKaG2cAvg75nxPuIrkfhtiQbe49xZEHk2VyfbROtE4QaUcxAtUnY83plo9VGb+dBhyt85josyX5PS6uOYWXD9qXUadft4xbTu9NMUXVpjgVyO31ngniky0KGnAiyLZ3nOIPvUMuiOnXiGlcMrahwZEzpnxGd4SVu8GGnjqtuJzWDglN8jzHXOAE7nCllrVcu4Ty+bH5SevncK634EkduobuBzslSzexq+cP82QLXWVFP7JNWw6kFDoNkeW5d/p3Bnkbyt6R9p36o/PE5BwXZyo7XJDqGKxi30DESPaUogF+EVjuDnJBBcJKxVqwkcxFi6r3DD+JlKVXCJ/NC/YCK9C9ufaWnfeo/evkmZ5xWB+f89BELhzA3C+W2fIj5zntzmdmICbcdhmOeansH+ONKOQlu4LSQQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nqC/PYmlMvLNcBBsxM5LmmccGIiYOpOFAyze98sqAECrFouQT3TZFqOLUiCnm9ZxOE+Ceh2flNGgAV2sD5q9z8L2srptApMumjDaaMoSxOqqmZNL80QEAWJVXJIqMrZ31NCUkMxF5fKddcPiHCTixjUW6q1VAgZzBMKL3ScySvGds0ExEc8txDw8gZNBj7+4nFV31ScTrdMuA3syESDcYPRBZTBl5hTpBDWmdG3LB6s7mHQ8G4VOqiJHrFBHBIEK+TmWaOTJQCv9riRpK6bp3aQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jvl+neXvUXZQrOmEIKuwq/W1bBDJoRkTbhpGUXUChYXdxKhHT4AryLJu7BIpeV0ULkZE+aEtUAblglAxSzCVCsbvdzx1g3EoAvrVZ20BnZ+nc0mwYRg334YXYrc2f2fNwF/7JRXvWOky3rAoQWHGQrrn5gGakFw3v/VELh1Gf0XZgXrcDti1oImgFb6x7tXusR3arrDAD8PYOrPv+9LVm0zqr750LIyIaej4Q+O1OSz9S0kIS7pefq9s2QShHcOtFwNR/PvA/LCTJf794EodzrLzQ4QBtrBJv9P8YiiCeLSRn0M1smFZub5oozLo3G796DMtq3thVxK8LOQr2E3ND0YpbJW25f9DJSVFdpd/DL2uaDc/s0cOMRcYpfoc/wx99+tjbw/ceCai8ap/BHM5oiQ==</encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqnRtoyvSmN3JCxbz0f7/BoYXJUHKqlVcx0/BTVJcGq925JHiSDEEDomVodZAa8PQg==</encrypted>]]>
      </text>
    </command>
    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf517B7oH+IiHsTdgTHWrLRgA0igJQu36FDysqMyb7CSif6Db/3NOdgs96ZofhF/KXJd9PeAIa+5wL4nxF4sFlR2BPE1+eBZl2xISheugqgJy1UCuXgl08EXPFZPnYadw49xW06FBwopzE3hSI9d6CGF3h2h+LWtwIUC7FEN+qnaQshURq9x7xrbVNYM/teoggbpH0R1zynDN0CBmEhzlsWk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYwUsrtY2Eca218RXxycFN/Vl4QOHfk2u436nK7AF+0RapfORx+e2HfWm5bxIb+KCNk4Mfq1i3YYWdNSIwTUju+tELRoYeb8GxmmvYVftBw502Qh45V6Cr6uA4yK+4jx+JsxJE9PxlswRHBWAtqV+J3/BNFDsn4w4Ikc0hcd+3OOux291yltGSqw/mjs7xMdTqZidAiHY9UAfiHBCfyG/OvIm4lD0DVvv/ZMESawwcDf+fjrgFrU0amLWHI7uD0DHr31HfOcAdpmkZ9JN6qESAGsxlZcsI+gqEOWJDELZNeVxuq7NVoI46cdWoJ227KfOB5QsNp1Y0ldkD16LhNY6Jg</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>