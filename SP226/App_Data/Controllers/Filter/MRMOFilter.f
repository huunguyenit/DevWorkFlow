<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "MRMO">
  <!ENTITY c11 "Lệnh sản xuất từ ngày">
  <!ENTITY c12 "Date From">
  <!ENTITY c21 "Số lệnh sản xuất">
  <!ENTITY c22 "MO Number">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'MRMOFilter', 'Filter', 'MRTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="phsx" code="stt_rec" order="ngay_ct, so_ct" id="SX1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn lệnh sản xuất" e="Select Manufacturing Order"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="&c21;" e="&c22;"></header>
      <items style="AutoComplete" controller="&Identity;Lookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpft4Sd4q5jokGETfCgExOZTTXMj7QsHmdY+otyHZoYfeWU2np8VlePmVor0sVLJzZwjramY/tPKwUxb72eAWKLgJWPS3Wn/vNDXj3YMRYT+jYIaAMyAJXZKnOXYIwssnzBSSFgdZxCJg7Xm2OyRRSwRDbR09CCtKW5IxIyKHu8jmC+1S3KUYZ1ou4UC2b8YvIq6ig3KIAK2fAlu/nJjLLb7iIuoauhnI4EW0uP138EjFQsk4kNgp/MPFdUln1OfqYk9Lj/2q2Kq9qA4keBk1qKcZJNm6HPhZyV4SIfXj4OUmu01LzqPBa5ZJyd61pDkm98=</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KU3qC26YeKeL7edhfPrfpCg/YTTJdjFCOs/4qPMwV+fShss9wW6Cv5nAulvtCjAwAtl/ReZoFCnUqfyeYjTcy2kz3QKnGmBJ6Fg38kMVMo5TmIRVIOpVUrMY1KxHT82eaUwNeIZcCoBtnxmLXjz4mzm8iqkeqqJUgb8KRnWZQ0vjQRgsqbQCXrhbBmNWO2h/ssjnQf3/na8LdvdAjiS2V5tcL6MkMzKFA0U96VMwqzGvkUiIsCGu2VM1fN1qeHCCLmVZ2+tLdT8hbPJg8me4jU9dlZZWp3Bfi9v85GjnBPlXN2N68zAzpJkzJGEVV5V5Uloh9R/ZmHQmdgG7wiypWnC8F8aYo/MsTmwTQlwuG5gtrrpQu5aDf0AGK5/VNjn9Cneuqp1eIYYFclYZHNSluhMZ9SwtEuZ5ziMcZchp7wwx0y0rMPbsPL27Mz44Rd/pDaVXDrzeqn7EBg0Gr+uEmPUyb0Y2YsQqmIwx8j9+P5UAZgmEPARVngTU5kB5YT22B0vQ2RdeNyR1YtaWBdmYsCY6Q9aXlYjdz4gt+BHXnNlev/57M8e8S6sHM8KOmYoC3++AZqTOPEUZuboU5O7Rz7TlOr6TyjYt5X9k95VdftDU7lOiLpMZdBPY7fLjFJx3XEHFQJvh6bLxX6O1MLqH4jwIIXxB8NEbm+O84c6ewwPv0uvWYOSAph+ygQiiWq7rCHYXCsPlLq++r62G1nY2oy1ce9p9z0YmlWjyPR2LnAyg3esqWdtTBsRSOyZ3onHThg44rVd43r2Alzu22yFv61EyP/Opqoo3qMHBBi1dRSVKku6YYanoCCX+qzcL1xvyrYdbSufUkV8DaXSJ0QkVG6YiBqqIniegD3te5nSyZ61BGupj5rTcNnN5xd9RmG7tYC3LnAY/jEB2ryrEpGCYhKEtjRQ+66FTLZxDGXfOVQlEXYmIPjI56UzBTmwvd3La10b93O37IsoTYBga1suewU08FOy7BH7NaYBoVA9+aw6Spb+K5T5Z0iwDZtRE0r2IUZ2yookTp5cRj7oaEIZWqBTxxWFYevc2oddwoC/l9Q/ONJG3tuvcRULzAzHCAe4s8DwSJSpznMHlppWvRf7eAyf5FDOpcTw51wcZesdxmO/V9kYzs2x3xKuc5iDUM1t4uQhvm1qzJZ+q7kKH3cEEyBFTOSFL+VYBIGRYwgUHJmBa+3z81ok8z5VMW6CXKBXtt+MKWnkj10Etcf0wsO9BaAOhaiaJVQqdGtJ+2wH7zn</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIFuWhFfGwAduO+uG+CZheu7v8Md/DB/7K4gO10NsYIR6X9W2xD2NJwpLSOWpo8Eh/oQ0fCIypCm8IX8Y09pYeqyzJhdnb8ieURfB80D9JoI54zJISGCPHA1xb7mtLOFU3ZtzVl25yhFFbMcAiNvwmtwRKVm6/ueL6m8jpS6Uuk4A==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWKciZtO3jhZffO9EJzsdj9EsiaBUE747e//3RnkUwb7Wp7g+V9Raf23CaYJ4oqqB8ywXXz7fWEI4+F4eKwQJqXADJN/D72KtvWBAStoXeMAP51/hnDOGI+f0ifxcGDoVsqktu5GnCFHBlqKjgoYV9GOv+QY7IppMVI3yASFycQu8KjPJ+rgcn7o1I08AOa8raI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3qeBZQhxWm9N1jRkDfSC40OHkd2DXY0N0S9OSWHXjUiFW+QJt4fV8dVINzErNnhRZdgmMtp+5Wi+CtdIuC9Swcw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNzr5CBr8L6XnwsuxeQoiUffsWo+UJaxSPxz5Na+JgujI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOa1wUDkf4erlYqHQKmfZnk7rVrjNxGeG/fyHmnw7I+mROCPsRUNMqTO0ZRq66KnqTK6ej6ZGnErZ4jHs8vh4SzNE4sYiPB40z5UnKCitg+Kt/iB6Ra1p5duD6Vwmr+PciZ6wwQgikJC2HqhxAZwZf42Uk4b7l3bIkDmDQPF+wO1w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrKMYCHssObkBLe1+DexzOpe5lULK1cFZqpupY1zLddAAhYVNkkkwzOx0iC+UZwZ2HH6tpF7742069kbRbeepWMK2K/444lS0CTrzN6XcnepoBycKQCyHyEAvMaFI2kZNp9Pb017inyiRg1JYXDO10Mo7WMBa5FO4Ni9A3IdpIgMsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaH/CtUuLy/hvt3u8Bvftrye0XvNf0rLnyjPSKspRBurHg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sVpitp0+hFILyKfrnwQpCmVQKG08UnmtL+roi6QO9FKOA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/ymZ9l54qC/L2yU4fowjEL9nmGanANZheBzn+KFNsg/pYOoPyLmPCpOM6hxBX+OXtw==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>