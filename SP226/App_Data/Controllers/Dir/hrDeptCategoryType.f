<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY Identity "hrDeptCategoryType">
]>

<dir table="hrloaipnbp" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại phân nhóm bộ phận" e="Department Category Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
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
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="1100: [ten_loai].Label, [ten_loai]"/>
      <item value="1100: [ten_loai2].Label, [ten_loai2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2n4f7jl0jX8hzbsWRhvYc+On9S5oefEl6iw4NanziAh</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKbiSjkFcI/ngXr3ppv1QXEi2tpnJO5inih2V+LNg0rYvg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKbiSjkFcI/ngXr3ppv1QXEi2tpnJO5inih2V+LNg0rYvg==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulitBK3ezEyT+gb+riBolOrDannoifrmxxRy1yDferwVmTaV8+swE8Pdknl1t7y/INznrtue/hJ4tFxce9e8xC1LjlhwJLyDP/Ko1a+hfg6O8mkmOF9HRYwvxe/l8fqffM5VAbNFQUG7Ut1aiL80qXNObhYYsO9KZsEY+MmfF8ynSv/tDpO4qAA+sqB3KdCoQ1tCSitUrOlRx+iPi+bdm1BwsCM6uRCPlUDdVv3qvMitT2HOoic9rAiQqlq3jy7LXF7JcaM6Ii+onPKRhLt/vu1Py2GY7z2NPwZwVlzJJb3Ll8ZX19mKrJA/9rvjLEJELtPwPZT99+qGJLR+bNSGSRnuZsi/yKkvc5b/VXtARq7yQS8Ol/ttRQk7wYt1+p3zbuc</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cw31vS+RQkTY3YTtPd8RS/513zBddUVSWIKiSIraUJyV72DfB8l1zvsXatrDUdAKypSp90q3tMeeyKRML+SudxwMqg34DSockfPBj23jY6eN7bbx7vIhdmY9fnnurRVfChikddTauiDF5/IrJS0ujfk/GWQ8wSNM6NUDj2PZU6P2tCMCB+8wNr2W0RTP0QJEQmn/xEyRzDVjy/gKvJiAY8NozsOBv/VwaKIXvFA8bAOU=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7Aliwdd/EakLofYr5ZnJy/Zh4kxX5ke3zx2rbcADhRmWl7k/ncHovHpJIQBfXBr8r+qA+WkOFg4ZZ/MhsnPUmnpfBpj/Y9mZCNrpoVn8LHryRCBYHos+RcH+xwvR8kfUACykvAM6jvp/UVWEICmMp+3s4dthVWyAmxKmUZuFGcAPLnemTL6aoT/fS/e+7nsz68in68TNKOsZLXf4jlx7mM9Rd08qecr/PCq4O31htmwrF0dr0TYea2oQ8AHON+TJJe</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbetWfBl0hcG73VT+s/+ZHj2hznlozytuZ4Xiqd+p6WVUY</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERiWz7dgA8/vCipdWA1D4vA/KXtevHCZSmz5jvymxr810t0VmVWR6Byl02/Hx2GzSvA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfOUy5NjeU+Mf5Ff3GWkJODur3AyPA7T9ZHVQwD9Brs/yFSYXXXEET+Hxk3xpg8CZ3Q==</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERlsJRtb7H064dSrjbaiOpmkiYnI8mw437knhEuVpROcIb9aJv/O8ugeGEG4VxsD8/A==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfJMk/HVltgk7OuasWeNFIWIU5k4xDjymaBwkYUkdkCVKE+xYxUokT2AEDFGVxj+gHROmUS3O6etRJafJedY5Nt8=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfCP296pKBalKUNxwEp9xtIUOVoLDXukVs3aJx6k42PvkPJ07oj/kAY2/EgYfXsncdPRw7yuIrLDhK5G4xXEgSDwqz3yhbRj9AW0C6RDC0mRq06ni/lbRGBVt+6oQYHRfxymPfpVKT7zpH9hvyWo23Q7CVJEGvXfumEYir0n/5ME8lg+tj950aFlY+GqsTebYnrFJyjTWrAbGKjmonvYUZluLcJeMo7vjiPxLc8igTtp/Jxcg6JXzd1W4IzVbq4UbyA==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>