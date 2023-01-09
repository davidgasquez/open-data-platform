select
    *
from {{ source('main', 'hits') }}
